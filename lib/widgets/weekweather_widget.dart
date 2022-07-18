import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/daily.dart';
import '../utils/constans.dart';
import '../utils/theme.dart';

class SevenDayWidget extends StatefulWidget {
  const SevenDayWidget({Key? key, required this.daily}) : super(key: key);
  final List<Daily> daily;
  @override
  State<SevenDayWidget> createState() => _SevenDayWidgetState();
}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MyColors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? WeekweatherList(daily: widget.daily)
          : Padding(
              padding: const EdgeInsets.only(bottom: 17.0),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forecast for 7 Days',
                        style: MyTheme.main16w500b,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Image(
                        width: 24,
                        height: 24,
                        color: MyColors.main2,
                        image: AssetImage(
                          'icons/arrowdownward.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class WeekweatherList extends StatelessWidget {
  const WeekweatherList({
    Key? key,
    required this.daily,
  }) : super(key: key);
  final List<Daily> daily;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: MyColors.main2,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forecast for 7 Days',
                    style: MyTheme.main16w500,
                  ),
                ],
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: daily.length,
              itemBuilder: (context, index) {
                return ListView(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 17),
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            index == 0
                                ? 'Today'
                                : DateFormat('E').format(
                                    DateTime.now().add(
                                      Duration(days: index),
                                    ),
                                  ),
                            style: MyTheme.main16w500,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              const Image(
                                width: 24,
                                height: 24,
                                color: MyColors.white,
                                image: AssetImage(
                                  'icons/fluent_weather-rain-showers-day-24-filled.png', //description > icon
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${((daily[index].pop ?? 0) * 100).ceil()}% rain',
                                style: MyTheme.main12w400,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${(daily[index].temp.day.toInt() - 273.14).ceil()}°/${(daily[index].temp.day.toInt() - 273.14).ceil()}°',
                            style: MyTheme.main12w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
