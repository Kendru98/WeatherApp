import 'package:aplikacja_pogodowa/models/main.dart';
import 'package:aplikacja_pogodowa/models/wind.dart';
import 'package:json_annotation/json_annotation.dart';

import 'weather.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel({
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
  });
  List<Weather> weather;
  Main main;
  int visibility;
  Wind wind;
  String name;
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
