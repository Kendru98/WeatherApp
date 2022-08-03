import 'package:hive/hive.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 1)
class WeatherItem {
  const WeatherItem({
    required this.lat,
    required this.lon,
    required this.name,
    required this.description,
    required this.temp,
    required this.tempFeelsLike,
  });

  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lon;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final double temp;

  @HiveField(5)
  final double tempFeelsLike;
}
