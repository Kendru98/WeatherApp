import 'package:aplikacja_pogodowa/apikey.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/3.0/onecall")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('?lat={lat}&lon={lon}&exclude=minutely&appid=${ApiKey.apiKey}')
  Future<GetWeatherResponse> getWeather(
      @Path('lat') String lat, @Path('lon') String lon);
}
