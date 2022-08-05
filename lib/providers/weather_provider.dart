import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';

class WeatherKey extends Equatable {
  final double lat;
  final double lon;

  const WeatherKey(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}

class WeatherProvider extends ChangeNotifier {
  final int _citieslimit = 5;

  bool _isError = false;
  bool get isError => _isError;

  List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  Box<WeatherItem> box = Hive.box<WeatherItem>('cities');

  final Map<WeatherKey, bool> _loadings = {};
  Map<WeatherKey, bool> get loadings => _loadings;

  final Map<WeatherKey, GetWeatherResponse> _weather = {};
  Map<WeatherKey, GetWeatherResponse> get weather => _weather;

  WeatherKey getFromWeatherItem(WeatherItem item) {
    return WeatherKey(item.lat, item.lon);
  }

  GetWeatherResponse? getWeatherForCity(WeatherItem item) {
    WeatherKey key = getFromWeatherItem(item);

    GetWeatherResponse? downloadedWeather = _weather[key];
    if (downloadedWeather != null) {
      return downloadedWeather;
    }
    if (!_loadings.containsKey(key)) {
      fetchData(item.lat, item.lon);
    }
    return null;
  }

  WeatherProvider() {
    _cities = box.values.toList();
  }

  Future<void> fetchData(double lat, double lon) async {
    WeatherKey key = WeatherKey(lat, lon);
    _loadings[key] = true;

    final dio = Dio();
    final client = RestClient(dio);

    try {
      var response = await client.getWeather('$lat', '$lon');
      _weather[key] = response;
    } catch (e) {
      catchError();
    }
    _loadings[key] = false;
    notifyListeners();
  }

  Future<void> addNewWeatherItem(double lat, double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    final String city = locationName(placemarks[0]) ?? '';

    WeatherItem weatherItem = WeatherItem(
      lat: lat,
      lon: lon,
      name: city,
    );
    await manageList(weatherItem);
    notifyListeners();
  }

  String? locationName(Placemark placemark) {
    if (placemark.locality == '') {
      if (placemark.administrativeArea != '') {
        return placemark.administrativeArea;
      } else {
        return placemark.country;
      }
    }
    return placemark.locality;
  }

  Future<Location?> isCityExistAndInit(String cityName) async {
    List<Location> position = await locationFromAddress(cityName);

    if (position.isNotEmpty) {
      return position.first;
    }

    return null;
  }

  void catchError() {
    _isError = true;
  }

  void resetErrorAndLoadings() {
    _isError = false;
    _loadings.clear();
    notifyListeners();
  }

  Future<void> manageList(WeatherItem weatherItem) async {
    List<WeatherItem> temp = [..._cities];
    if (!temp.contains(weatherItem)) {
      if (temp.length == _citieslimit) {
        temp.removeLast();
      }
    } else {
      temp.removeWhere((element) => element == weatherItem);
    }
    await insertAtFirst(temp, weatherItem);
  }

  Future<void> insertAtFirst(
    List<WeatherItem> temp,
    WeatherItem weatherItem,
  ) async {
    temp.insert(0, weatherItem);
    await box.clear();
    await box.addAll(temp);
    _cities = box.values.toList();
    notifyListeners();
  }
}
