import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:collection/collection.dart';

class WeatherProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  String _city = '';
  String get city => _city;

  double _lat = 0;
  double get lat => _lat;

  double _lon = 0;
  double get lon => _lon;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;

  Future<void> initLocation(Position value) {
    _lat = value.latitude;
    _lon = value.longitude;
    return fetchData(lat, lon);
  }

  Future<void> fetchDataByCityName(String cityName) async {
    _isLoading = true;
    fetchData(_lat, _lon);
  }

  Future<void> fetchData(double lat, double lon) async {
    _isLoading = true;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    _city = returnLocalizationName(placemarks[0]) ?? '';
    final dio = Dio();
    final client = RestClient(dio);

    try {
      _currentWeather = await client.getWeather('$lat', '$lon');
    } catch (e) {
      print(e);
    }
    WeatherItem weatherItem = WeatherItem(
        lat: lat,
        lon: lon,
        name: _city,
        description: _currentWeather.current.weather[0].description,
        temp: _currentWeather.current.temp,
        tempFeelsLike: _currentWeather.current.feelsLike);

    if (getByCityCoords(lon, lat) == null) {
      _cities.add(weatherItem);
    }

    _isLoading = false;
    notifyListeners();
  }

  WeatherItem? getByCityCoords(double lon, double lat) {
    WeatherItem? weatherItem = _cities.firstWhereOrNull(
      (element) => element.lon == lon && element.lat == lat,
    );

    return weatherItem;
  }

  String? returnLocalizationName(Placemark placemark) =>
      placemark.locality == ''
          ? placemark.administrativeArea
          : placemark.locality;

  Future<bool> cityNameCheck(String cityName) async {
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
}
