import 'package:aplikacja_pogodowa/models/weather_model.dart';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'weather_api.g.dart';

// @RestApi(baseUrl: 'api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=54793b33007ce0e9cc5f9515aa13e92b') //forecast
//https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=54793b33007ce0e9cc5f9515aa13e92b //current
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('')
  Future<WeatherModel> getWeather();
}
