import 'package:aplikacja_pogodowa/models/feelslike.dart';
import 'package:aplikacja_pogodowa/models/temp.dart';
import 'package:aplikacja_pogodowa/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  Daily({
    required this.feelsLike,
    this.rain,
    this.pop,
    required this.temp,
    required this.weather,
  });
  @JsonKey(name: 'feels_like')
  FeelsLike feelsLike;
  double? rain;
  double? pop;
  Temp temp;
  List<Weather> weather;
  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
