import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:flutter/material.dart';

class HourlyList extends StatelessWidget {
  const HourlyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Now',
          style: MyTheme.main16w500,
        ),
        const SizedBox(
          height: 9,
        ),
        const Image(
          width: 24,
          height: 24,
          color: MyColors.white,
          image: AssetImage(
            'icons/fluent_weather-rain-showers-day-24-filled.png',
          ),
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
  }
}
