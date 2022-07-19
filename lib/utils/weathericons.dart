chooseIcon(String description) {
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
  } else if (description.contains('mist')) {
    return 'icons/hazy.png';
  }
}

chooseMainIcon(String description) {
  if (description.contains('clear')) {
    return 'icons/weather-sunny.png';
  } else if (description.contains('rain')) {
    return 'icons/weather-rain.png';
  } else if (description.contains('cloud')) {
    return 'icons/cloud-sun.png';
  } else if (description.contains('storm')) {
    return 'icons/weather-lightning.png';
  }
}
