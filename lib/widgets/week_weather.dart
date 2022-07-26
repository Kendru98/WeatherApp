import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/week_weather_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WeekWeather extends StatefulWidget {
  const WeekWeather({Key? key, required this.daily}) : super(key: key);

  final List<Daily> daily;
  @override
  State<WeekWeather> createState() => _WeekWeatherState();
}

class _WeekWeatherState extends State<WeekWeather> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isExpanded
          ? Container(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: MyColors.mainDark,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Forecast for 7 Days',
                              style: MyTheme.main16w500,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Transform.rotate(
                              angle: 180 * math.pi / 180,
                              child: const Image(
                                width: 24,
                                height: 24,
                                color: MyColors.whiteBackground,
                                image: AssetImage(
                                  'icons/arrowdownward.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: widget.daily.length,
                    itemBuilder: (context, index) {
                      return WeekWeatherItem(
                        daily: widget.daily[index],
                        dayIndex: index,
                      );
                    },
                  ),
                ],
              ),
            )
          : TextButton(
              style: ElevatedButton.styleFrom(
                primary: MyColors.whiteBackground,
                elevation: 0,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forecast for 7 Days',
                    style: MyTheme.main16w500b,
                  ),
                  const SizedBox(width: 4),
                  const Image(
                    width: 24,
                    height: 24,
                    color: MyColors.mainDark,
                    image: AssetImage(
                      'icons/arrowdownward.png',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
