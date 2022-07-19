import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // bool _isloadLocation = false;
  // bool get isloadLocation => _isloadLocation;

  double lat = 0.0;
  double get _lat => lat;

  double lon = 0.0;
  double get _lon => lon;
  late GetWeatherResponse _currentWeather;
  //GetWeatherResponse('', 0.0, 0.0,Current(0, 0, 0, 0, 0, 0, <Weather>[], 0.0), <Current>[], <Daily>[]);
  GetWeatherResponse get currentWeather => _currentWeather;

  initLocation(Position value) async {
    lat = value.latitude;
    lon = value.longitude;
    fetchData(_lat, _lon);
  }

  void fetchData(double lat, double lon) async {
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
