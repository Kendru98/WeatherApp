import 'package:json_annotation/json_annotation.dart';

part 'feelslike.g.dart';

@JsonSerializable()
class FeelsLike {
  FeelsLike(
    this.day,
    this.night,
  );
  double day;
  double night;
  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);
}
