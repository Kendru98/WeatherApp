import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:flutter/material.dart';

class SevenDayWidget extends StatefulWidget {
  const SevenDayWidget({Key? key}) : super(key: key);

  @override
  State<SevenDayWidget> createState() => _SevenDayWidgetState();
}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      child: _isExpanded
          ? Container(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: MyColors.mainDark,
              ),
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
                          'Forcast for 7 Days',
                          style: MyTheme.main16w500,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 17),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Sun',
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
                                      color: MyColors.whiteBackground,
                                      image: AssetImage(
                                        'icons/fluent_weather-rain-showers-day-24-filled.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '74% rain',
                                      style: MyTheme.main12w400,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '20/24',
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
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Column(
                children: [
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
                        color: MyColors.mainDark,
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
