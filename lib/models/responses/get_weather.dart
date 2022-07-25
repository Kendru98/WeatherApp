import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_weather.g.dart';

@JsonSerializable()
class GetWeatherResponse {
  GetWeatherResponse({
    required this.timezone,
    required this.lat,
    required this.lon,
    required this.current,
    required this.hourly,
    required this.daily,
  });
  String timezone;
  double lat;
  double lon;
  Current current;
  List<Current> hourly;
  List<Daily> daily;

  factory GetWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWeatherResponseFromJson(json);
}
