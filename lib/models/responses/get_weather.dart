import 'package:aplikacja_pogodowa/models/current.dart';

import 'package:json_annotation/json_annotation.dart';

import '../daily.dart';

part 'get_weather.g.dart';

@JsonSerializable()
class GetWeatherResponse {
  GetWeatherResponse(
    this.timezone,
    this.lat,
    this.lon,
    this.current,
    this.hourly,
    this.daily,
  );
  String timezone;
  double lat;
  double lon;
  Current current;
  List<Current> hourly;
  List<Daily> daily;

  factory GetWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherResponseFromJson(json);
}
