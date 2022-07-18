import 'package:aplikacja_pogodowa/pages/searchcity_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/homepage_widgets.dart';

import '../utils/constans.dart';
import '../utils/theme.dart';

enum MenuOptions { share, settings }

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Add Your Code here.
    // });

    return Scaffold(
      backgroundColor: MyColors.white,
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [MyColors.main1, MyColors.main2],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  //first widget
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchPage(),
                                ));
                          },
                          icon: const Image(
                            width: 32,
                            height: 32,
                            color: MyColors.white,
                            image: AssetImage(
                              'icons/akar-icons_plus.png',
                            ),
                          ),
                          color: MyColors.white,
                        ),
                        Text(
                          provider.currentWeather.timezone,
                          style: MyTheme.main16w600,
                        ),
                        PopupMenuButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: MenuOptions.share,
                                child: Text(
                                  'Share',
                                  style: MyTheme.popmenutext,
                                ),
                              ),
                              PopupMenuItem(
                                value: MenuOptions.settings,
                                child: Text(
                                  'Settings',
                                  style: MyTheme.popmenutext,
                                ),
                              ),
                            ];
                          },
                          onSelected: (MenuOptions selectedvalue) =>
                              actionPopUp(selectedvalue),
                          icon: const Image(
                            width: 32,
                            height: 32,
                            color: MyColors.white,
                            image: AssetImage(
                              'icons/carbon_overflow-menu-vertical.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          color: MyColors.white,
                          image: AssetImage(
                            'icons/weather-rain.png',
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEEE').format(DateTime.now()),
                                  style: MyTheme.main16w400,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 11)),
                                const SizedBox(
                                  height: 19,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    width: 2,
                                    thickness: 2,
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 11)),
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
                      rainchance:
                          '${((provider.currentWeather.hourly[0].pop ?? 0) * 100).ceil()}%',
                      humidity: '${provider.currentWeather.current.humidity} %',
                      pressure:
                          '${provider.currentWeather.current.pressure} mbar',
                      wind:
                          '${(provider.currentWeather.current.wind_speed * 3.6).toStringAsPrecision(2)} km/h',
                    )
                  ],
                ),
              ),
              HourlyWeather(
                hourly: provider.currentWeather.hourly,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: SevenDayWidget(daily: provider.currentWeather.daily)),
            ],
          );
        },
      ),
    );
  }

  actionPopUp(value) {
    if (value == MenuOptions.share) {
      //TODO
    } else if (value == MenuOptions.settings) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsPage(),
          ));
    }
  }
}
