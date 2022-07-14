import 'package:aplikacja_pogodowa/pages/searchcity_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/theme/theme.dart';
import 'package:aplikacja_pogodowa/widgets/weekweather_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                      colors: [MyColors.main1, MyColors.main2],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter),
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
                            //Nawiguj do ekranu zarzadzania lokalizacją
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 32,
                          ),
                          color: MyColors.white,
                        ),
                        Text('Malang', style: MyTheme.main16w600),
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
                                child:
                                    Text('Share', style: MyTheme.popmenutext),
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
                          icon: const Icon(
                            Icons.more_vert_sharp,
                            size: 32,
                            color: MyColors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(FontAwesomeIcons.cloudSunRain,
                                color: Colors.white, size: 72),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sunday', style: MyTheme.main16w400),
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
                        Text('24°', style: MyTheme.main72w700),
                        Text(
                          'Heavy rain',
                          style: MyTheme.main16w400,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    FontAwesomeIcons.wind,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '3,7 km/h',
                                      style: MyTheme.main12w400,
                                    ),
                                    Text(
                                      'Wind',
                                      style: MyTheme.main12w400,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    FontAwesomeIcons.cloudRain,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '74%',
                                      style: MyTheme.main12w400,
                                    ),
                                    Text(
                                      'Chance of rain',
                                      style: MyTheme.main12w400,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    FontAwesomeIcons.thermometer,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1010 mbar',
                                      style: MyTheme.main12w400,
                                    ),
                                    Text(
                                      'Pressure',
                                      style: MyTheme.main12w400,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    FontAwesomeIcons
                                        .water, //bad possitioning why?
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '83%',
                                      style: MyTheme.main12w400,
                                    ),
                                    Text(
                                      'Humidity 83%',
                                      style: MyTheme.main12w400,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 9, left: 16),
              height: 140, //error?
              color: MyColors.main2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sunday',
                        style: MyTheme.main16w600,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 8)),
                      const SizedBox(
                        height: 19,
                        child: VerticalDivider(
                          color: MyColors.white,
                          width: 2,
                          thickness: 2,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        'Nov 14',
                        style: MyTheme.main16w600,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 104, // error

                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 11,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Now',
                                style: MyTheme.main16w500,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const Icon(
                                Icons.cloudy_snowing,
                                size: 24,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '20°/24°',
                                style: MyTheme.main12w400,
                              ),
                              Text(
                                '74% rain',
                                style: MyTheme.main12w400,
                              ),
                              const SizedBox(
                                width: 72,
                              )
                            ],
                          );
                        },
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SevenDayWidget()
          ],
        ),
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
