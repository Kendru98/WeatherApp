import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:aplikacja_pogodowa/providers/permissions.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/weathericons.dart';
import 'package:aplikacja_pogodowa/widgets/appbar.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

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
          appBar: CustomAppBar(
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
              //scroll
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [MyColors.mainLight, MyColors.mainDark],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
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
                                '${(provider.currentWeather.current.temp.toInt() - 273.14).ceil()}°',
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
                        rainchance:
                            '${((provider.currentWeather.hourly[0].pop ?? 0) * 100).ceil()}%',
                        wind:
                            '${(provider.currentWeather.current.wind_speed * 3.6).toStringAsPrecision(2)} km/h',
                      )
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

  void onClickPlusButton(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchCityPage(),
        ));
  }
}
