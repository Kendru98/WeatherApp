import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CitiesHistoryItem extends StatelessWidget {
  const CitiesHistoryItem({
    Key? key,
    required this.weatherItem,
    required this.cityIndex,
  }) : super(key: key);
  final WeatherItem weatherItem;
  final int cityIndex;

  void onTapCityList(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    provider.addNewWeatherItem(weatherItem.lat, weatherItem.lon);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(WeatherPage.routeName, (Route route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    return Selector<WeatherProvider, GetWeatherResponse?>(
      selector: (_, provider) =>
          provider.getWeatherForCity(provider.cities[cityIndex]),
      builder: (context, weatherData, child) {
        if (provider.loadings[
                provider.getFromWeatherItem(provider.cities[cityIndex])] ==
            true) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: ListTile(
            onTap: () => onTapCityList(context),
            title: Text(
              textAlign: TextAlign.left,
              weatherItem.name,
              style: MyTheme.city16,
            ),
            subtitle: Text(
              textAlign: TextAlign.left,
              '${DataConversionHelpers.temperatureConversion(weatherData!.current.temp)}/${DataConversionHelpers.temperatureConversion(weatherData.current.feelsLike)}',
              style: MyTheme.city12,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                  width: 32,
                  height: 32,
                  color: MyColors.popText,
                  image: AssetImage(
                    DataConversionHelpers.chooseMainIcon(
                        weatherData.current.weather[0].description),
                  ),
                ),
                Text(
                  weatherData.current.weather[0].description,
                  style: MyTheme.city12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
