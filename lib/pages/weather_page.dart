import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:aplikacja_pogodowa/providers/permissions.dart';
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
        builder: (context) => SearchCityPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    checkPermission(context);

    return Consumer<ApiProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: MyColors.whiteBackground,
          appBar: WeatherAppBar(
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                              chooseMainIcon(provider.currentWeather.current
                                  .weather[0].description),
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
                                temperatureConversion(
                                    provider.currentWeather.current.temp),
                                style: MyTheme.main72w700,
                              ),
                              Text(
                                provider.currentWeather.current.weather[0]
                                    .description,
                                style: MyTheme.main16w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                      WeatherGrid(
                        humidity:
                            '${provider.currentWeather.current.humidity}%',
                        pressure:
                            '${provider.currentWeather.current.pressure} mbar',
                        rainchance: rainConversion(
                            provider.currentWeather.hourly[0].pop),
                        wind: windConversion(
                            provider.currentWeather.current.wind_speed),
                      ),
                    ],
                  ),
                ),
                HourlyWeather(
                  hourly: provider.currentWeather.hourly,
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: SevenDayWidget(daily: provider.currentWeather.daily),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
