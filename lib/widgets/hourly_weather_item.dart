import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({
    Key? key,
    required this.hourly,
    required this.index,
  }) : super(key: key);

  final List<Current> hourly;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          index == 0
              ? 'Now'
              : DateFormat('HH:mm').format(
                  DateTime.now().add(Duration(hours: index)),
                ),
          style: MyTheme.main16w600,
        ),
        const SizedBox(height: 9),
        Image(
          width: 24,
          height: 24,
          color: MyColors.whiteBackground,
          image: AssetImage(chooseIcon(hourly[index].weather[0].description)),
        ),
        const SizedBox(height: 4),
        Text(
            '${temperatureConversion(hourly[index].temp)}/${temperatureConversion(hourly[index].feels_like)}',
            style: MyTheme.main12w400),
        Text('${rainConversion(hourly[index].pop)} rain',
            style: MyTheme.main12w400),
        const SizedBox(width: 72)
      ],
    );
  }
}
