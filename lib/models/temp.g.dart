// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      day: (json['day'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      night: (json['night'] as num).toDouble(),
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
    };
