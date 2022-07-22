import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:collection/collection.dart';

class ApiProviderAndDataHandling extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<WeatherItem> _cities = [];
  List<WeatherItem> get cities => _cities;

  String? _city = '';
  String? get city => _city;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;

  initLocation(Position value) {
    double lat = value.latitude;
    double lon = value.longitude;
    fetchData(lat, lon);
  }

  Future<void> cityToCoords(String cityName) async {
    List<Location> locations = await locationFromAddress(cityName);
    _isLoading = true;
    notifyListeners();
    fetchData(locations[0].latitude, locations[0].longitude);
  }

  Future<void> fetchData(double lat, double lon) async {
    _isLoading = true;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    _city = localityNullCheck(placemarks[0]);
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
        name: _city ?? '0',
        description: _currentWeather.current.weather[0].description,
        temp: _currentWeather.current.temp,
        tempFeelsLike: _currentWeather.current.feelsLike);
    if (ifCityExist(_city) == null) {
      _cities.add(weatherItem);
    }

    _isLoading = false;
    notifyListeners();
  }

  ifCityExist(String? cityName) {
    WeatherItem? weatherItem =
        _cities.firstWhereOrNull(((element) => element.name == cityName));
    if (weatherItem == null) {
      return null;
    } else {
      return weatherItem;
    }
  }

  String? localityNullCheck(Placemark placemark) {
    String? localization;
    if (placemark.locality == "") {
      localization = placemark.administrativeArea;
    } else {
      localization = placemark.locality;
    }
    return localization;
  }

  bool isCitiesFull(List<WeatherItem> list) {
    if (list.length == 5) {
      return true;
    } else {
      return false;
    }
  }

  cityNameCheck(String cityName) async {
    try {
      await locationFromAddress(cityName);
    } catch (e) {
      print(e);
      return 'error';
    }
  }
}
