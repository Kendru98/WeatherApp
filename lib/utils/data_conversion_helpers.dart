import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

extension DataConversions on double {
  String get tempC => '${(this - 273.14).ceil()}°';
  String get tempF => '${((this * 1.8) - 459.67).toStringAsPrecision(2)}F';
  String get windKm => '${(this * 3.6).toStringAsPrecision(2)} km/h';
  String get windMs => '${toStringAsPrecision(2)} m/s';
  String get rain => '${(this * 100).ceil()}%';

  static String windConversion(double? wind, BuildContext context) {
    final provider = context.read<SettingsProvider>();
    if (provider.currentSettings.wind == 'kmh') {
      return wind != null ? wind.windKm : '0 km/h';
    } else {
      return wind != null ? wind.windMs : '0 m/s';
    }
  }

  static String temperatureConversion(
    double temperature,
    BuildContext context,
  ) {
    final provider = context.read<SettingsProvider>();
    if (provider.currentSettings.temperature == 'celsius') {
      return temperature.tempC;
    } else {
      return temperature.tempF;
    }
  }

  static String rainConversion(double? rain) {
    return rain != null ? rain.rain : '0%';
  }
}

class DataConversionHelpers {
  static String chooseIcon(String description) {
    if (description.contains('rain')) {
      return 'icons/fluent_weather-rain-24-regular.png';
    } else if (description.contains('snow')) {
      return 'icons/mdi_weather-snowy-heavy.png';
    } else if (description.contains('thunderstorm')) {
      return 'icons/chancetstorms.png';
    } else if (description.contains('clear sky')) {
      return 'icons/fluent_weather-sunny-24-regular.png';
    } else if (description.contains('clouds')) {
      return 'icons/cloudy.png';
    } else {
      return 'icons/hazy.png';
    }
  }

  static String chooseMainIcon(String description) {
    if (description.contains('clear')) {
      return 'icons/weather-sunny.png';
    } else if (description.contains('rain')) {
      return 'icons/weather-rain.png';
    } else if (description.contains('cloud')) {
      return 'icons/cloud-sun.png';
    } else {
      return 'icons/weather-lightning.png';
    }
  }
}
