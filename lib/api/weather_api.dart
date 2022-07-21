import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'weather_api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('')
  Future<GetWeatherResponse> getWeather();
}
