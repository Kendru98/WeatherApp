import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather_item.g.dart';

@HiveType(typeId: 1)
class WeatherItem extends Equatable {
  const WeatherItem({
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
}
