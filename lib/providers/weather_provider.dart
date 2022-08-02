import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class WeatherKey {
  final double lat;
  final double lon;

  WeatherKey(this.lat, this.lon);
}

class WeatherProvider extends ChangeNotifier {
  final int citieslimit = 5;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  List<Location> _position = [];
  List<Location> get position => _position;

  List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  GetWeatherResponse? _currentWeather;
  GetWeatherResponse? get currentWeather => _currentWeather;

  Box<WeatherItem> box = Hive.box<WeatherItem>('cities');

  Map<WeatherKey, GetWeatherResponse> _weather = {};
  Map<WeatherKey, GetWeatherResponse> get weather => _weather;

  Map<WeatherKey, bool> _loadings = {};

  GetWeatherResponse? getWeatherForCity(WeatherItem item) {
    final key = WeatherKey(item.lat, item.lon);
    final test = _weather[WeatherKey(item.lat, item.lon)];

    if (test != null) {
      return test;
    }

    if (!_loadings.containsKey(key)) {
      fetchData(item.lat, item.lon);
    }
  }

  WeatherProvider() {
    _cities = box.values.toList();
  }

  // Future<void> initLocation(double lat, double lon) async {
  //   _lat = lat;
  //   _lon = lon;
  //
  //   return fetchData();
  // }
  //
  // Future<void> fetchDataAndSort(WeatherItem weatherItem) async {
  //   if (_cities.first != weatherItem) {
  //     await setMainCity(weatherItem);
  //   }
  //   await initLocation(weatherItem.lat, weatherItem.lon);
  // }

  Future<void> fetchData(double lat, double lon) async {
    _isLoading = true;

    // final WeatherItem? currentItem = getByCityCoords(_lat, _lon);
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    final String city = locationName(placemarks[0]) ?? '';

    final dio = Dio();
    final client = RestClient(dio);

    try {
      _currentWeather = await client.getWeather('$lat', '$lon');
      WeatherItem weatherItem = WeatherItem(
        lat: lat,
        lon: lon,
        name: city,
        description: _currentWeather!.current.weather[0].description,
        temp: _currentWeather!.current.temp,
        tempFeelsLike: _currentWeather!.current.feelsLike,
      );

      if (_cities.length == citieslimit) {
        deleteLastFromDatabase();
      } else if (_cities.contains(weatherItem) == false) {
        addWeatherItemToDatabase(weatherItem);
      }
    } catch (e) {
      catchError();
    }
    _cities = box.values.toList();
    weather[WeatherKey(lat, lon)] = _currentWeather!; //dodaje to mapy
    _isLoading = false;
    notifyListeners();
  }

  WeatherItem? getByCityCoords(double lat, double lon) {
    WeatherItem? weatherItem = _cities.firstWhereOrNull(
      (element) => element.lon == lon && element.lat == lat,
    );

    return weatherItem;
  }

  String? locationName(Placemark placemark) => placemark.locality == ''
      ? placemark.administrativeArea
      : placemark.locality;

  Future<bool> cityCheckAndInit(String cityName) async {
    List<Location> position = await locationFromAddress(cityName);
    if (position.isEmpty) {
      return false;
    }
    return true;
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

  Future<void> deleteLastFromDatabase() async {
    await box.deleteAt(citieslimit);
  }
}
