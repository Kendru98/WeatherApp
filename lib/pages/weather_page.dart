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
import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  static const routeName = '/weather-page';

  void onClickPlusButton(BuildContext context) {
    Navigator.of(context).pushNamed(SearchCityPage.routeName);
  }

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
    Current currentWeatherData = provider.currentWeather!.current;
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
          if (provider.isLoading) {
            return const LoadingScreen();
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WeatherAppBar(
                  title: Text(
                    provider.city,
                    style: MyTheme.main16w600,
                  ),
                  leading: IconButton(
                    onPressed: () => onClickPlusButton(context),
                    icon: const Image(
                      width: 32,
                      height: 32,
                      color: MyColors.whiteBackground,
                      image: AssetImage('icons/akar-icons_plus.png'),
                    ),
                    color: MyColors.whiteBackground,
                  ),
                  actions: const [
                    HomepageMenu(),
                  ],
                ),
                WeatherBackgroundContainer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.cities.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Row(
                                    children: [
                                      index == i
                                          ? const CircleAvatar(
                                              radius: 6,
                                              backgroundColor:
                                                  MyColors.whiteBackground,
                                            )
                                          : const CircleAvatar(
                                              radius: 6,
                                              backgroundColor:
                                                  MyColors.whiteBackground,
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor:
                                                    MyColors.mainLight,
                                              ),
                                            ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: 120,
                            color: MyColors.whiteBackground,
                            image: AssetImage(
                              DataConversionHelpers.chooseMainIcon(
                                  currentWeatherData.weather[0].description),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(DateTime.now()),
                                    style: MyTheme.main16w400,
                                  ),
                                  const SizedBox(width: 11),
                                  const SizedBox(
                                    height: 19,
                                    child: VerticalDivider(
                                      color: Colors.white,
                                      width: 2,
                                      thickness: 2,
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                  Text(
                                    DateFormat('MMM d').format(DateTime.now()),
                                    style: MyTheme.main16w400,
                                  ),
                                ],
                              ),
                              Text(
                                DataConversionHelpers.temperatureConversion(
                                    currentWeatherData.temp),
                                style: MyTheme.main72w700,
                              ),
                              Text(
                                currentWeatherData.weather[0].description,
                                style: MyTheme.main16w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      WeatherGrid(
                        //TODO [WeatherGrid] positioning bad when text lenght changes
                        humidity: '${currentWeatherData.humidity}%',
                        pressure: '${currentWeatherData.pressure} mbar',
                        rainchance: DataConversionHelpers.rainConversion(
                            provider.currentWeather?.hourly[0].pop),
                        wind: DataConversionHelpers.windConversion(
                            currentWeatherData.windSpeed),
                      ),
                    ],
                  ),
                ),
                HourlyWeather(
                  hourly: provider.currentWeather!.hourly,
                ),
                const SizedBox(height: 16),
                WeekWeather(daily: provider.currentWeather!.daily),
              ],
            ),
          );
        },
      ),
    );
  }
}
