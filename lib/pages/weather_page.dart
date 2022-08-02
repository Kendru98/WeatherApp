import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/loading_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/widgets/weather_error.dart';
import 'package:aplikacja_pogodowa/widgets/weather_swiper_item.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  static const routeName = '/weather-page';

  void onClickDownloadData(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    provider.loadAgain();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    if (provider.isLoading) {
      return const LoadingScreen();
    }
    if (provider.isError) {
      return WeatherError(
        onPressed: () {
          onClickDownloadData(context);
        },
      );
    }
    Current currentWeatherData = provider.currentWeather!.current;
    List<Current> hourlyWeatherData = provider.currentWeather!.hourly;
    List<Daily> currentWeatherDaily = provider.currentWeather!.daily;
    return Scaffold(
      backgroundColor: MyColors.whiteBackground,
      body: Swiper(
        itemCount: provider.cities.length,
        onIndexChanged: (value) {
          WeatherItem currentWeatherItem = provider.cities[value];
          provider.initLocation(currentWeatherItem.lat, currentWeatherItem.lon);
        },
        itemBuilder: (context, index) {
          return WeatherSwiperItem(
            cityname: provider.city,
            cityLength: provider.cities.length,
            index: index,
            currentWeather: currentWeatherData,
            hourlyWeather: hourlyWeatherData,
            dailyWeather: currentWeatherDaily,
          );
        },
      ),
    );
  }
}
