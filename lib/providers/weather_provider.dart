import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  String _city = '';
  String get city => _city;

  double _lat = 0;
  double get lat => _lat;

  double _lon = 0;
  double get lon => _lon;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;

  Box<WeatherItem> box = Hive.box<WeatherItem>('cities');

  Future<void> initLocation(double lat, double lon) {
    _lat = lat;
    _lon = lon;
    return fetchData();
  }

  Future<void> fetchData() async {
    _cities = box.values.toList();
    _isLoading = true;

    List<Placemark> placemarks = await placemarkFromCoordinates(_lat, _lon);
    _city = locationName(placemarks[0]) ?? '';
    final dio = Dio();
    final client = RestClient(dio);

    try {
      _currentWeather = await client.getWeather('$_lat', '$_lon');
    } catch (e) {
      catchError();
      print(e);
    }
    WeatherItem weatherItem = WeatherItem(
        lat: _lat,
        lon: _lon,
        name: _city,
        description: _currentWeather.current.weather[0].description,
        temp: _currentWeather.current.temp,
        tempFeelsLike: _currentWeather.current.feelsLike);

    if (getByCityCoords(_lon, _lat) == null) {
      addWeatherItemToDatabase(weatherItem);
    }
    _cities = box.values.toList();
    _isLoading = false;
    notifyListeners();
  }

  WeatherItem? getByCityCoords(double lon, double lat) {
    WeatherItem? weatherItem = _cities.firstWhereOrNull(
      (element) => element.lon == lon && element.lat == lat,
    );

    return weatherItem;
  }

  String? locationName(Placemark placemark) => placemark.locality == ''
      ? placemark.administrativeArea
      : placemark.locality;

  Future<bool> cityCheckAndInit(String cityName) async {
    try {
      List<Location> position = await locationFromAddress(cityName);
      if (position.isEmpty) {
        return false;
      }
      _lat = position[0].latitude;
      _lon = position[0].longitude;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void catchError() {
    _isError = true;
    notifyListeners();
  }

  void loadAgain() {
    _isError = false;
    _isLoading = false;
    notifyListeners();
  }

  void addWeatherItemToDatabase(WeatherItem weatherItem) {
    box.add(weatherItem);
  }

  void deleteLastFromDatabase() {
    box.deleteAt(0);
  }
}
