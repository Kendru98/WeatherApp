import 'package:aplikacja_pogodowa/api/weather_api.dart';

import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String lat = '52.23';
  String get _lat => lat;
  String lon = '21.01';
  String get _lon => lon;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;
  // 'https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=minutely&appid=54793b33007ce0e9cc5f9515aa13e92b');
  ApiProvider() {
    fetchData(_lat, _lon);
  }
  void fetchData(String lat, String lon) async {
    _isLoading = true;
    final dio = Dio();
    final client = RestClient(dio,
        baseUrl:
            'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=54793b33007ce0e9cc5f9515aa13e92b');

    try {
      GetWeatherResponse response =
          await client.getWeather().then((value) => value);

      _currentWeather = response;
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }
}
