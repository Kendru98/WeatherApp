import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/current.dart';
import '../utils/constans.dart';
import '../utils/theme.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key, required this.hourly}) : super(key: key);
  final List<Current> hourly;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 9, bottom: 4),
      color: MyColors.mainDark,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: MyTheme.main16w600,
              ),
              const Padding(padding: EdgeInsets.only(right: 8)),
              const SizedBox(
                height: 19,
                child: VerticalDivider(
                  color: MyColors.whiteBackground,
                  width: 2,
                  thickness: 2,
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                DateFormat('MMM d').format(DateTime.now()),
                style: MyTheme.main16w600,
              ),
            ],
          ),
          SizedBox(
            height: 104,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: hourly.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      index == 0
                          ? 'Now'
                          : DateFormat('HH:mm').format(
                              DateTime.now().add(
                                Duration(hours: index),
                              ),
                            ),
                      style: MyTheme.main16w500,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Image(
                      width: 24,
                      height: 24,
                      color: MyColors.whiteBackground,
                      image: AssetImage(
                        'icons/fluent_weather-rain-showers-day-24-filled.png',
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${hourly[index].temp.toInt() - 273.14.ceil()}°/${hourly[index].feels_like.toInt() - 273.14.ceil()}°',
                      style: MyTheme.main12w400,
                    ),
                    Text(
                      '${((hourly[index].pop ?? 0) * 100).ceil()}% rain',
                      style: MyTheme.main12w400,
                    ),
                    const SizedBox(
                      width: 72,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
