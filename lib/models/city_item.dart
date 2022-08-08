import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'city_item.g.dart';

@HiveType(typeId: 1)
class CityItem extends Equatable {
  const CityItem({
    required this.lat,
    required this.lon,
    required this.name,
  });

  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lon;

  @HiveField(2)
  final String name;

  @override
  List<Object?> get props => [
        lat,
        lon,
        name,
      ];

  WeatherKey get key {
    return WeatherKey(lat, lon);
  }
}
