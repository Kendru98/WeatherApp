import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind {
  Wind(
    this.speed,
    this.deg,
    this.gust,
  );
  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
