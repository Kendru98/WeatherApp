// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      feelsLike: FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      rain: (json['rain'] as num?)?.toDouble(),
      pop: (json['pop'] as num?)?.toDouble(),
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'feels_like': instance.feelsLike,
      'rain': instance.rain,
      'pop': instance.pop,
      'temp': instance.temp,
      'weather': instance.weather,
    };
