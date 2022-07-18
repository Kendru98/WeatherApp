import 'package:aplikacja_pogodowa/pages/searchcity_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';

import '../widgets/homepage_widgets.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
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
                      'Malang',
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
                              'Sunday',
                              style: MyTheme.main16w400,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 11)),
                            const SizedBox(
                              height: 19,
                              child: VerticalDivider(
                                color: Colors.white,
                                width: 2,
                                thickness: 2,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 11)),
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
          const SizedBox(
            height: 16,
          ),
          const Flexible(child: SevenDayWidget()),
        ],
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
