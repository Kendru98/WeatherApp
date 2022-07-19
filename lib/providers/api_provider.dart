import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _city = '';
  String? get city => _city;

  late GetWeatherResponse _currentWeather;
  GetWeatherResponse get currentWeather => _currentWeather;

  initLocation(Position value) {
    double lat = value.latitude;
    double lon = value.longitude;

    fetchData(lat, lon);
  }

  Future<void> fetchData(double lat, double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    _city = placemarks[0].locality;
    print(placemarks);
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
