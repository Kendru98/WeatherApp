import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({
    Key? key,
    required this.hourly,
    required this.hourIndex,
  }) : super(key: key);

  final Current hourly;
  final int hourIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hourIndex == 0
              ? S.of(context).nowHoursWidget
              : '${DateFormat('HH').format(
                  DateTime.now().add(
                    Duration(hours: hourIndex),
                  ),
                )}:00',
          style: MyTheme.main16w600,
        ),
        const SizedBox(height: 9),
        Image(
          width: 24,
          height: 24,
          color: MyColors.whiteBackground,
          image: AssetImage(
              DataConversionHelpers.chooseIcon(hourly.weather[0].description)),
        ),
        const SizedBox(height: 4),
        Text(
            '${DataConversions.temperatureConversion(hourly.temp, context)}/${DataConversions.temperatureConversion(hourly.feelsLike, context)}',
            style: MyTheme.main12w400),
        Text(
            '${DataConversions.rainConversion(hourly.pop)} ${S.of(context).rain}',
            style: MyTheme.main12w400),
        const SizedBox(width: 72)
      ],
    );
  }
}
