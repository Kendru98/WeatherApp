class DataConversionHelpers {
  String chooseIcon(String description) {
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

  String chooseMainIcon(String description) {
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

  String temperatureConversion(double temperature) {
    return '${(temperature.toInt() - 273.14.ceil())}°';
    //ifuserunit.kelwins => temperature.toInt()
  }

  String windConversion(double? wind) {
    return '${(wind ?? 0 * 3.6).toStringAsPrecision(2)} km/h';
  }

  String rainConversion(double? rain) {
    return '${((rain ?? 0) * 100).ceil()}%';
  }
}
