import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

  static String temperatureConversion(
    double temperature,
    BuildContext context,
  ) {
    final provider = context.watch<SettingsProvider>();
    if (provider.currentSettings!.temperature == 'celsius') {
      return '${(temperature.toInt() - 273.14.ceil())}°';
    } else {
      return '${((temperature.toInt() * 1.8) - 459.67).toStringAsPrecision(2)}F';
    }
  }

  static String windConversion(double? wind, BuildContext context) {
    final provider = context.watch<SettingsProvider>();
    if (provider.currentSettings!.wind == 'kmh') {
      return '${((wind ?? 0) * 3.6).toStringAsPrecision(2)} km/h';
    } else {
      return '${(wind ?? 0).toStringAsPrecision(2)} m/s';
    }
  }

  static String rainConversion(double? rain) {
    return '${((rain ?? 0) * 100).ceil()}%';
  }
}
