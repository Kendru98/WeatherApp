import 'package:hive_flutter/hive_flutter.dart';

part 'settings.g.dart';

enum MenuTemperature { celsius, fahrenheit }

enum MenuWind { kmh, ms }

enum MenuLanguage { english, polish }

@HiveType(typeId: 2)
class Settings extends HiveObject {
  Settings({
    required this.temperature,
    required this.wind,
    required this.language,
  });

  @HiveField(0)
  String temperature;
  @HiveField(1)
  String wind;
  @HiveField(2)
  String language;

  Settings copyWith({
    String? temperature,
    String? wind,
    String? language,
  }) =>
      Settings(
        temperature: temperature ?? this.temperature,
        wind: wind ?? this.wind,
        language: language ?? this.language,
      );
}
