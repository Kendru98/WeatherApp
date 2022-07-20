import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:flutter/material.dart';

class WeekWeatherItem extends StatelessWidget {
  const WeekWeatherItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 17),
      child: Row(
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
                const SizedBox(width: 10),
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
    );
  }
}
