import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/pages/loading_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/widgets/weather_error.dart';
import 'package:aplikacja_pogodowa/widgets/weather_swiper_item.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  static const routeName = '/weather-page';

  void onClickDownloadData(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    provider.resetErrorAndLoadings();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    if (provider.isError) {
      return WeatherError(
        onPressed: () {
          onClickDownloadData(context);
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.whiteBackground,
      body: Swiper(
        itemCount: provider.cities.length,
        itemBuilder: (context, index) {
          return Selector<WeatherProvider,
              Tuple2<Map<WeatherKey, bool>, GetWeatherResponse?>>(
            selector: (_, provider) => Tuple2(provider.loadings,
                provider.getWeatherForCity(provider.cities[index])),
            builder: (context, weatherData, child) {
              if (weatherData.item1[
                      provider.getFromWeatherItem(provider.cities[index])] ==
                  true) {
                return const LoadingScreen();
              }
              return WeatherSwiperItem(
                index: index,
                currentWeather: weatherData.item2,
                cityname: provider.cities[index].name,
                cityLength: provider.cities.length,
              );
            },
          );
        },
      ),
    );
  }
}
