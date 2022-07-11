import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 62, bottom: 16),
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                        colors: [Color(0xff62B8F6), Color(0xff2C79C1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 32,
                              color: Color(0xffffffff),
                            )),
                        Text(
                          'Malang',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert_sharp,
                              size: 32,
                              color: Color(0xffffffff),
                            )),
                      ],
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.cloudRain),
                          IntrinsicHeight(
                            child: Row(
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
                                Padding(padding: EdgeInsets.only(right: 11.0)),
                                const VerticalDivider(
                                  color: Colors.white,
                                  width: 2,
                                  thickness: 2,
                                ),
                                Padding(padding: EdgeInsets.only(left: 11.0)),
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
                          ),
                          Column(
                            children: [
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
                              const Divider(
                                color: Colors.white,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.wind,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '3,7 km/h',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ),
                                                Text(
                                                  'Wind',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.cloudRain,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '74%',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ),
                                                Text(
                                                  'Chance of rain',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                )
                                              ],
                                            ),
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
                                          const Icon(
                                            FontAwesomeIcons.thermometer,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '1010 mbar',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ),
                                                Text(
                                                  'Pressure',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons
                                                .water, //bad possitioning why?
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '83%',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ),
                                                Text(
                                                  'Humidity 83%',
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xffffffff),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 140,
              color: Color(0xff2C79C1),
            ),
            ExpansionTile(
              trailing: const Icon(
                FontAwesomeIcons.anglesDown,
                color: Color(0xff2C79C1),
                size: 24,
              ),
              title: Text(
                'Forcast for 7 Days',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xff2C79C1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
              tilePadding: EdgeInsets.symmetric(horizontal: 110),
              children: [
                ListView.builder(
                  //consumer
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: Text('Sun'),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
