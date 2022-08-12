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
  });

  @HiveField(0)
  String temperature;
  @HiveField(1)
  String wind;

  Settings copyWith({
    String? temperature,
    String? wind,
  }) =>
      Settings(
        temperature: temperature ?? this.temperature,
        wind: wind ?? this.wind,
      );
}
