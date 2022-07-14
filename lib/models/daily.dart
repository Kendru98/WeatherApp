import 'package:aplikacja_pogodowa/models/feelslike.dart';
import 'package:aplikacja_pogodowa/models/temp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  Daily(this.feels_like, this.rain, this.pop, this.temp);
//? Description
  FeelsLike feels_like;
  double? rain;
  double? pop;
  Temp temp;
  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
