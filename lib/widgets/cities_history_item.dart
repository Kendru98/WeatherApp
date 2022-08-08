import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/models/city_item.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class CitiesHistoryItem extends StatelessWidget {
  const CitiesHistoryItem({
    Key? key,
    required this.weatherItem,
    required this.cityIndex,
  }) : super(key: key);
  final CityItem weatherItem;
  final int cityIndex;

  void onTapCityList(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    provider.addNewCityItem(weatherItem.lat, weatherItem.lon);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(WeatherPage.routeName, (Route route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    final citiesList = provider.cities;
    final currentWeatherItem = citiesList[cityIndex];

    return Selector<WeatherProvider, Tuple2<GetWeatherResponse?, bool>>(
      selector: (_, provider) => Tuple2(
        provider.getWeatherForCity(currentWeatherItem),
        provider.loadings[currentWeatherItem.key] ?? true,
      ),
      builder: (context, weatherData, child) {
        if (weatherData.item2) {
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
              '${DataConversionHelpers.temperatureConversion(weatherData.item1!.current.temp)}/${DataConversionHelpers.temperatureConversion(weatherData.item1!.current.feelsLike)}',
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
                        weatherData.item1!.current.weather[0].description),
                  ),
                ),
                Text(
                  weatherData.item1!.current.weather[0].description,
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
