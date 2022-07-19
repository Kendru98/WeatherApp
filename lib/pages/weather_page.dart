import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/weathericons.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  checkPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild(context);
      });
    }
  }

  Future executeOnceAfterBuild(BuildContext context) async {
    final provider = Provider.of<ApiProvider>(context, listen: false);
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Włącz lokalizację aby pobrać dane'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'))
              ],
            );
          });
    } else {
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.lowest,
              forceAndroidLocationManager: true,
              timeLimit: const Duration(seconds: 5))
          .then((value) => {provider.initLocation(value)})
          .onError((error, stackTrace) => {
                Geolocator.getLastKnownPosition(
                        forceAndroidLocationManager: true)
                    .then((value) => {provider.initLocation(value!)})
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkPermission(context);
    return Scaffold(
      backgroundColor: MyColors.whiteBackground,
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading == false) {
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
                    colors: [MyColors.mainLight, MyColors.mainDark],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => onClickPlusButton(context),
                          icon: const Image(
                            width: 32,
                            height: 32,
                            color: MyColors.whiteBackground,
                            image: AssetImage('icons/akar-icons_plus.png'),
                          ),
                          color: MyColors.whiteBackground,
                        ),
                        Text(provider.currentWeather.timezone,
                            style: MyTheme.main16w600),
                        const HomepageMenu(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          color: MyColors.whiteBackground,
                          image: AssetImage(
                            chooseMainIcon(provider
                                .currentWeather.current.weather[0].description),
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
                      humidity: '${provider.currentWeather.current.humidity} %',
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
          );
        },
      ),
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
