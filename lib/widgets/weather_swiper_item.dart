import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/models/responses/get_weather.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
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

class WeatherSwiperItem extends StatelessWidget {
  const WeatherSwiperItem({
    Key? key,
    required this.index,
    required this.currentWeather,
    required this.cityname,
    required this.cityLength,
  }) : super(key: key);

  final int index;
  final GetWeatherResponse? currentWeather;
  final String cityname;
  final int cityLength;
  void onClickPlusButton(BuildContext context) {
    Navigator.of(context).pushNamed(SearchCityPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    print(currentWeather);

    Current currentWeatherData = currentWeather!.current;
    List<Current> hourlyWeatherData = currentWeather!.hourly;
    List<Daily> dailyWeatherData = currentWeather!.daily;
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
                DotsIndicator(listLength: cityLength, currentDotIndex: index),
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
                            currentWeatherData.temp,
                          ),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
                WeatherGrid(
                  humidity: '${currentWeatherData.humidity}%',
                  pressure: '${currentWeatherData.pressure} mbar',
                  rainchance: DataConversionHelpers.rainConversion(
                      dailyWeatherData[0].pop),
                  wind: DataConversionHelpers.windConversion(
                    currentWeatherData.windSpeed,
                  ),
                ),
              ],
            ),
          ),
          HourlyWeather(hourly: hourlyWeatherData),
          const SizedBox(height: 16),
          WeekWeather(daily: dailyWeatherData),
        ],
      ),
    );
  }
}
