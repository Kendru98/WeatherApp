import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_appbar.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_exports.dart';
import 'package:aplikacja_pogodowa/widgets/homepage_menu.dart';

import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  void onClickPlusButton(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchCityPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteBackground,
      appBar: WeatherAppBar(
        title: const Text('Malang'),
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
          mainAxisSize: MainAxisSize.max,
          children: [
            WeatherBackgroundContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        color: MyColors.whiteBackground,
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
                                'Sunday',
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
                                'Nov 14',
                                style: MyTheme.main16w400,
                              ),
                            ],
                          ),
                          Text(
                            '24°',
                            style: MyTheme.main72w700,
                          ),
                          Text(
                            'Heavy rain',
                            style: MyTheme.main16w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const WeatherGrid()
                ],
              ),
            ),
            const HourlyWeather(),
            const SizedBox(height: 16),
            const SevenDayWidget(),
          ],
        ),
      ),
    );
  }
}
