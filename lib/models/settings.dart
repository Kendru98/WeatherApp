import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'settings.g.dart';

@HiveType(typeId: 2)
class Settings extends Equatable {
  Settings({
    required this.language,
    required this.wind,
    required this.temperature,
  });

  @HiveField(0)
  late String temperature;
  @HiveField(1)
  late String wind;
  @HiveField(2)
  late String language;

  @override
  List<Object?> get props => [temperature, wind, language];
}