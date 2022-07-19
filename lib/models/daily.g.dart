// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      (json['rain'] as num?)?.toDouble(),
      (json['pop'] as num?)?.toDouble(),
      Temp.fromJson(json['temp'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'feels_like': instance.feels_like,
      'rain': instance.rain,
      'pop': instance.pop,
      'temp': instance.temp,
      'weather': instance.weather,
    };
