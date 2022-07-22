import 'package:aplikacja_pogodowa/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  Current({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    required this.weather,
    this.pop,
  });
  double temp;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  int pressure;
  int humidity;
  int clouds;
  List<Weather> weather;
  @JsonKey(name: 'wind_speed')
  double windSpeed;
  double? pop;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
