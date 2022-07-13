import 'package:aplikacja_pogodowa/pages/searchcity_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
    });
    //final provider = Provider.of<ApiProvider>(context);
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
                                //Nawiguj do ekranu zarzadzania lokalizacją
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 32,
                              ),
                              color: const Color(0xffffffff),
                            ),
                            Text(
                              'City', //'${provider.currentWeather.main}',
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
                                  'Sunday',
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
                                  'Nov 14',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                            Text(
                              '24°',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 72,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text(
                              'Heavy rain',
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
                                            '3,7 km/h',
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
                                            '74%',
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
                                            '1010 mbar',
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
                                            '83%',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            'Humidity 83%',
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
                  //width: double.infinity,
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
                              'Sunday',
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
                              'Nov 14',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Container(
                            height: 104,
                            // width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 11,
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
                                            'Now',
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
                                            '20°/24°',
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Text(
                                            '74% rain',
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
                                          'Sun',
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
                                              '74% rain',
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
                                          '20/24',
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
