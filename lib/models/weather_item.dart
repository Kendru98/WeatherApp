import 'package:hive/hive.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 1)
class WeatherItem {
  WeatherItem({
    required this.lat,
    required this.lon,
    required this.name,
    required this.description,
    required this.temp,
    required this.tempFeelsLike,
  });

  @HiveField(0)
  double lat;

  @HiveField(1)
  double lon;

  @HiveField(2)
  String name;

  @HiveField(3)
  String description;

  @HiveField(4)
  double temp;

  @HiveField(5)
  double tempFeelsLike;
}
