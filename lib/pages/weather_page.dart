import 'package:aplikacja_pogodowa/pages/searchcity_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Add Your Code here.
    // });

    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<ApiProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: [Color(0xff62B8F6), Color(0xff2C79C1)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
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
                              icon: const Icon(
                                Icons.add,
                                size: 32,
                              ),
                              color: const Color(0xffffffff),
                            ),
                            Text(
                              provider.currentWeather.timezone,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            PopupMenuButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: 'share',
                                    child: Text(
                                      'Share',
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1B2541),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'settings',
                                    child: Text(
                                      'Settings',
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1B2541),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (String value) => actionPopUp(value),
                              icon: const Icon(
                                Icons.more_vert_sharp,
                                size: 32,
                                color: Color(0xffffffff),
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
                                padding: EdgeInsets.all(8.0),
                                child: Icon(FontAwesomeIcons.cloudSunRain,
                                    color: Colors.white, size: 72),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEEE').format(DateTime.now()),
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 11.0)),
                                const SizedBox(
                                  height: 19,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    width: 2,
                                    thickness: 2,
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 11.0)),
                                Text(
                                  DateFormat('MMM d').format(DateTime.now()),
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                            Text(
                              '${(provider.currentWeather.current.temp.toInt() - 273.14).ceil()}°', //.main.temp.toInt() - 273.14).ceil()}°', //todo change C / Kelvins
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 72,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text(
                              ' ${provider.currentWeather.current.weather[0].description}',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 105,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          FontAwesomeIcons.wind,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${(provider.currentWeather.current.wind_speed * 3.6).toStringAsPrecision(2)} km/h',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            'Wind',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          FontAwesomeIcons.cloudRain,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${((provider.currentWeather.hourly[0].pop ?? 0) * 100).ceil()}%',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            'Chance of rain',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(
                                          FontAwesomeIcons.thermometer,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${provider.currentWeather.current.pressure} mbar',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            'Pressure',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(
                                            FontAwesomeIcons
                                                .water, //bad possitioning why?
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${provider.currentWeather.current.humidity} %',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            'Humidity ${provider.currentWeather.current.humidity}%',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  color: const Color(0xff2C79C1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9.0, left: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('EEEE').format(DateTime.now()),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Padding(padding: EdgeInsets.only(right: 8.0)),
                            const SizedBox(
                              height: 19,
                              child: VerticalDivider(
                                color: Colors.white,
                                width: 2,
                                thickness: 2,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 8.0)),
                            Text(
                              DateFormat('MMM d').format(DateTime.now()),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ), //newproviderforforecast?
                        SizedBox(
                            height: 104,
                            // width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.currentWeather.hourly.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 72,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat('HH:mm').format(
                                                DateTime.now().add(
                                                    Duration(hours: index))),
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          const Icon(
                                            Icons.cloudy_snowing,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '${(provider.currentWeather.hourly[index].temp.toInt() - 273.14).ceil()}°/${(provider.currentWeather.hourly[index].feels_like.toInt() - 273.14).ceil()}',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            '${((provider.currentWeather.hourly[index].pop ?? 0) * 100).ceil()}% rain',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: _isExpanded
                      ? Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff2C79C1),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Forcast for 7 Days',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                //consumer
                                shrinkWrap: true,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 48,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          DateFormat('E').format(DateTime.now()
                                              .add(Duration(days: index))),
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.cloud,
                                                color: Colors.white, size: 24),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${((provider.currentWeather.daily[index].pop ?? 0) * 100).ceil()}% rain',
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${(provider.currentWeather.daily[index].temp.day.toInt() - 273.14).ceil()}°/${(provider.currentWeather.daily[index].temp.night.toInt() - 273.14).ceil()}°',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Forcast for 7 Days',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Color(0xff2C79C1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const Icon(
                                FontAwesomeIcons.anglesDown,
                                color: Color(0xff2C79C1),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  actionPopUp(String value) {
    String message;
    if (value == 'share') {
      message = 'zaznaczyles edytowanie posta ';
      //TODO
    } else if (value == 'settings') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsPage(),
          ));
      message = 'Ustawienia';
    } else {
      message = 'Not implemented';
    }
    print(message);
  }
}
