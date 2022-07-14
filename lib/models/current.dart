import 'package:aplikacja_pogodowa/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  Current(
    this.temp,
    this.feels_like,
    this.pressure,
    this.humidity,
    this.clouds,
    this.wind_speed,
    this.weather,
    this.pop,
  );
  double temp;
  double feels_like;
  int pressure;
  int humidity;
  int clouds;
  List<Weather> weather;
  double wind_speed;
  double? pop;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
