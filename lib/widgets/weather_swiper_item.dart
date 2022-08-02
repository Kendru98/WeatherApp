import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/dots_indicator.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';
import 'package:aplikacja_pogodowa/widgets/weather_appbar.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherSwiperItem extends StatelessWidget {
  const WeatherSwiperItem({
    Key? key,
    required this.index,
    required this.currentWeather,
    required this.dailyWeather,
    required this.hourlyWeather,
    required this.cityname,
    required this.cityLength,
  }) : super(key: key);
  final Current currentWeather;
  final int index;
  final List<Current> hourlyWeather;
  final List<Daily> dailyWeather;
  final String cityname;
  final int cityLength;
  void onClickPlusButton(BuildContext context) {
    Navigator.of(context).pushNamed(SearchCityPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeatherAppBar(
            title: Text(
              cityname,
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
                DotsIndicator(listLength: cityLength, index: index),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 120,
                      color: MyColors.whiteBackground,
                      image: AssetImage(
                        DataConversionHelpers.chooseMainIcon(
                          currentWeather.weather[0].description,
                        ),
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
                            currentWeather.temp,
                          ),
                          style: MyTheme.main72w700,
                        ),
                        Text(
                          currentWeather.weather[0].description,
                          style: MyTheme.main16w400,
                        ),
                      ],
                    ),
                  ],
                ),
                WeatherGrid(
                  //TODO [WeatherGrid] positioning bad when text lenght changes
                  humidity: '${currentWeather.humidity}%',
                  pressure: '${currentWeather.pressure} mbar',
                  rainchance:
                      DataConversionHelpers.rainConversion(currentWeather.pop),
                  wind: DataConversionHelpers.windConversion(
                    currentWeather.windSpeed,
                  ),
                ),
              ],
            ),
          ),
          HourlyWeather(hourly: hourlyWeather),
          const SizedBox(height: 16),
          WeekWeather(daily: dailyWeather),
        ],
      ),
    );
  }
}
