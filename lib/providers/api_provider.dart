import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:collection/collection.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<WeatherItem> _cityList = [];
  List<WeatherItem> get cityList => _cityList;

  String? _city = '';
  String? get city => _city;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;

  cityNameCheck(String cityName) async {
    try {
      await locationFromAddress(cityName);
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future<void> cityToCoords(String cityName) async {
    List<Location> locations = await locationFromAddress(cityName);
    _isLoading = true;
    notifyListeners();
    fetchData(locations[0].latitude, locations[0].longitude);
  }

  initLocation(Position value) {
    double lat = value.latitude;
    double lon = value.longitude;

    fetchData(lat, lon);
  }

  Future<void> fetchData(double lat, double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    _city = localityNullCheck(placemarks[0]);
    final dio = Dio();
    final client = RestClient(dio,
        baseUrl:
            'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=54793b33007ce0e9cc5f9515aa13e92b');

    try {
      GetWeatherResponse response = await client.getWeather();
      _currentWeather = response;
      WeatherItem weatherItem = WeatherItem(
          lat,
          lon,
          _city ?? '0',
          _currentWeather.current.weather[0].description,
          _currentWeather.current.temp,
          _currentWeather.current.feels_like);
      if (ifCityExist(_city) == null) {
        _cityList.add(weatherItem);
      }
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  ifCityExist(String? cityName) {
    WeatherItem? weatherItem =
        _cityList.firstWhereOrNull(((element) => element.name == cityName));
    if (weatherItem == null) {
      return null;
    } else {
      return weatherItem;
    }
  }

  localityNullCheck(Placemark placemark) {
    String? localization;
    if (placemark.locality == "") {
      localization = placemark.administrativeArea;
    } else {
      localization = placemark.locality;
    }
    return localization;
  }

  bool isCityListFull(List<WeatherItem> list) {
    if (list.length == 5) {
      return true;
    } else {
      return false;
    }
  }
}
