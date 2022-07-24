import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/pages/loading_screen.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider_and_data_handling.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:aplikacja_pogodowa/widgets/weather_appbar.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  void onClickPlusButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchCityPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProviderAndDataHandling>(context);

    if (provider.isLoading) {
      return const LoadingScreen();
    } else {
      Current currentWeatherData = provider.currentWeather.current;
      return Scaffold(
        backgroundColor: MyColors.whiteBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WeatherAppBar(
                title: Text(
                  provider.city ?? provider.currentWeather.timezone,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 120,
                          color: MyColors.whiteBackground,
                          image: AssetImage(
                            DataConversionHelpers().chooseMainIcon(
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
                              DataConversionHelpers().temperatureConversion(
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
                      rainchance: DataConversionHelpers().rainConversion(
                          provider.currentWeather.hourly[0].pop),
                      wind: DataConversionHelpers()
                          .windConversion(currentWeatherData.windSpeed),
                    ),
                  ],
                ),
              ),
              HourlyWeather(
                hourly: provider.currentWeather.hourly,
              ),
              const SizedBox(height: 16),
              SevenDayWidget(daily: provider.currentWeather.daily),
            ],
          ),
        ),
      );
    }
  }
}
