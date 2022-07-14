// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeatherResponse _$GetWeatherResponseFromJson(Map<String, dynamic> json) =>
    GetWeatherResponse(
      json['timezone'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      Current.fromJson(json['current'] as Map<String, dynamic>),
      (json['hourly'] as List<dynamic>)
          .map((e) => Current.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetWeatherResponseToJson(GetWeatherResponse instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'lat': instance.lat,
      'lon': instance.lon,
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
