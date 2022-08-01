import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/loading_page.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:aplikacja_pogodowa/widgets/weather_appbar.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';
import 'package:aplikacja_pogodowa/widgets/weather_error.dart';
import 'package:aplikacja_pogodowa/widgets/weather_swiper.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

    if (provider.isError) {
      return WeatherError(
        onPressed: () {
          onClickDownloadData(context);
        },
      );
    }

    if (provider.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
      backgroundColor: MyColors.whiteBackground,
      body: Swiper(
        itemCount: provider.swiperCities.length,
        onIndexChanged: (value) {
          WeatherItem currentWeatherItem = provider.swiperCities[value];
          provider.initLocation(currentWeatherItem.lat, currentWeatherItem.lon);
        },
        itemBuilder: (context, index) {
          return WeatherSwiper(
            provider: provider,
            index: index,
          );
        },
      ),
    );
  }
}
