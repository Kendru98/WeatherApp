// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      main: $enumDecode(_$MainEnumMap, json['main']),
      icon: json['icon'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': _$MainEnumMap[instance.main]!,
      'icon': instance.icon,
      'description': instance.description,
    };

const _$MainEnumMap = {
  Main.clear: 'Clear',
  Main.clouds: 'Clouds',
  Main.rain: 'Rain',
  Main.thunderstorm: 'Thunderstorm',
  Main.drizzle: 'Drizzle',
  Main.snow: 'Snow',
  Main.mist: 'Mist',
  Main.smoke: 'Smoke',
  Main.haze: 'Haze',
  Main.dust: 'Dust',
  Main.fog: 'Fog',
  Main.sand: 'Sand',
  Main.ash: 'Ash',
  Main.squall: 'Squall',
  Main.tornado: 'Tornado',
};
