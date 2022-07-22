import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
  });

  double day;
  double min;
  double max;
  double night;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}
