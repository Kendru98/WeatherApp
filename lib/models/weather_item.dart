class WeatherItem {
  WeatherItem({
    required this.lat,
    required this.lon,
    required this.name,
    required this.description,
    required this.temp,
    required this.tempFeelsLike,
  });
  double lat;
  double lon;
  String name;
  String description;
  double temp;
  double tempFeelsLike;
}
