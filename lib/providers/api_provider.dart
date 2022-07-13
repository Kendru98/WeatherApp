import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/main.dart';
import 'package:aplikacja_pogodowa/models/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  var _currentWeather;
  get currentWeather => _currentWeather;

  ApiProvider() {
    fetchData();
  }
  void fetchData() async {
    _isLoading = true;
    final dio = Dio();
    final client = RestClient(dio,
        baseUrl:
            'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=54793b33007ce0e9cc5f9515aa13e92b');
    _currentWeather =
        client.getWeather(); //.then((value) => _currentWeather = value);
    print(_currentWeather);

    _isLoading = false;
    notifyListeners();
  }
}
