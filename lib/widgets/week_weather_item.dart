import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekWeatherItem extends StatelessWidget {
  const WeekWeatherItem({
    Key? key,
    required this.daily,
    required this.dayIndex,
  }) : super(key: key);
  final Daily daily;
  final int dayIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 17),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              dayIndex == 0
                  ? 'Today'
                  : DateFormat('E').format(
                      DateTime.now().add(Duration(days: dayIndex)),
                    ),
              style: MyTheme.main16w500,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Image(
                  width: 24,
                  height: 24,
                  color: MyColors.whiteBackground,
                  image: AssetImage(
                    DataConversionHelpers.chooseIcon(
                        daily.weather[0].description),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${DataConversionHelpers.rainConversion(daily.pop)} rain',
                  style: MyTheme.main12w400,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${DataConversionHelpers.temperatureConversion(daily.temp.max)}/${DataConversionHelpers.temperatureConversion(daily.temp.min)}',
              style: MyTheme.main12w400,
            ),
          )
        ],
      ),
    );
  }
}
