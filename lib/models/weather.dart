import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum Main {
  @JsonValue('Clear')
  CLEAR,
  @JsonValue('Clouds')
  CLOUDS,
  @JsonValue('Rain')
  RAIN,
}

@JsonSerializable()
class Weather {
  Weather(this.main, this.icon, this.description);
  Main main; //? Description
  String icon;
  String description;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
