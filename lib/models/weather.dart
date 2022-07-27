import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum Main {
  @JsonValue('Clear')
  clear,
  @JsonValue('Clouds')
  clouds,
  @JsonValue('Rain')
  rain,
  @JsonValue('Thunderstorm')
  thunderstorm,
  @JsonValue('Drizzle')
  drizzle,
  @JsonValue('Snow')
  snow,
  @JsonValue('Mist')
  mist,
  @JsonValue('Smoke')
  smoke,
  @JsonValue('Haze')
  haze,
  @JsonValue('Dust')
  dust,
  @JsonValue('Fog')
  fog,
  @JsonValue('Sand')
  sand,
  @JsonValue('Ash')
  ash,
  @JsonValue('Squall')
  squall,
  @JsonValue('Tornado')
  tornado,
}

@JsonSerializable()
class Weather {
  Weather({
    required this.main,
    required this.icon,
    required this.description,
  });

  Main main;
  String icon;
  String description;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
