import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class WeatherKey extends Equatable {
  final double lat;
  final double lon;

  const WeatherKey(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}

class WeatherProvider extends ChangeNotifier {
  final int citieslimit = 5;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  Location? _location;
  Location? get location => _location;

  List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  Box<WeatherItem> box = Hive.box<WeatherItem>('cities');

  final Map<WeatherKey, bool> _loadings = {};

  final Map<WeatherKey, GetWeatherResponse> _weather = {};
  Map<WeatherKey, GetWeatherResponse> get weather => _weather;

  GetWeatherResponse? getWeatherForCity(WeatherItem item) {
    var key = WeatherKey(item.lat, item.lon);
    var test = _weather[key];
    if (test != null) {
      return test;
    }
    if (!_loadings.containsKey(key)) {
      _loadings[key] = true;
      fetchData(item.lat, item.lon);
    }
    return null;
  }

  WeatherProvider() {
    _cities = box.values.toList();
  }

  Future<void> fetchData(double lat, double lon) async {
    _isLoading = true;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    final String city = locationName(placemarks[0]) ?? '';
    final dio = Dio();
    final client = RestClient(dio);

    try {
      var response = await client.getWeather('$lat', '$lon');
      WeatherItem weatherItem = WeatherItem(
        lat: lat,
        lon: lon,
        name: city,
        description: response.current.weather[0].description,
        temp: response.current.temp,
        tempFeelsLike: response.current.feelsLike,
      );
      var key = WeatherKey(weatherItem.lat, weatherItem.lon);
      _weather[key] = response;
    } catch (e) {
      catchError();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDataAndAddCity(double lat, double lon) async {
    _isLoading = true;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    final String city = locationName(placemarks[0]) ?? '';
    final dio = Dio();
    final client = RestClient(dio);

    try {
      var response = await client.getWeather('$lat', '$lon');
      WeatherItem weatherItem = WeatherItem(
        lat: lat,
        lon: lon,
        name: city,
        description: response.current.weather[0].description,
        temp: response.current.temp,
        tempFeelsLike: response.current.feelsLike,
      );

      if (!_cities.contains(weatherItem)) {
        await addWeatherItemToDatabase(weatherItem);
      }

      var key = WeatherKey(weatherItem.lat, weatherItem.lon);
      _weather[key] = response;
    } catch (e) {
      catchError();
    }
    _isLoading = false;
    notifyListeners();
  }

  String? locationName(Placemark placemark) => placemark.locality == ''
      ? placemark.administrativeArea
      : placemark.locality;

  Future<Location?> isCityExistAndInit(String cityName) async {
    List<Location> position = await locationFromAddress(cityName);
    if (position.isNotEmpty) {
      return _location = position[0];
    }
    return null;
  }

  void catchError() {
    _isError = true;
  }

  void loadAgain() {
    _isError = false;
    _isLoading = false;
  }

  Future<void> addWeatherItemToDatabase(WeatherItem weatherItem) async {
    List<WeatherItem> temp = [..._cities];
    if (_cities.length == citieslimit) temp.removeLast();
    temp.insert(0, weatherItem);
    await box.clear();
    await box.addAll(temp);
    _cities = box.values.toList();
  }

  Future<void> setMainCity(WeatherItem weatherItem) async {
    List<WeatherItem> temp = [..._cities];
    temp.removeWhere((element) =>
        element.lat == weatherItem.lat && element.lon == weatherItem.lon);
    temp.insert(0, weatherItem);
    await box.clear();
    await box.addAll(temp);
  }

  Future<void> setAsFirst(WeatherItem weatherItem) async {
    if (_cities.first != weatherItem) {
      await setMainCity(weatherItem);
    }
    _cities = box.values.toList();
    notifyListeners();
  }
}
