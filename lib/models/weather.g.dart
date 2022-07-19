// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      $enumDecode(_$MainEnumMap, json['main']),
      json['icon'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': _$MainEnumMap[instance.main]!,
      'icon': instance.icon,
      'description': instance.description,
    };

const _$MainEnumMap = {
  Main.CLEAR: 'Clear',
  Main.CLOUDS: 'Clouds',
  Main.RAIN: 'Rain',
};
