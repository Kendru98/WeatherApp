import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeatherItem extends StatelessWidget {
  final DataConversionHelpers dataConversionHelpers = DataConversionHelpers();
  HourlyWeatherItem({
    Key? key,
    required this.hourly,
    required this.index,
  }) : super(key: key);

  final Current hourly;
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
              : '${DateFormat('HH').format(
                  DateTime.now().add(Duration(hours: index)),
                )}:00',
          style: MyTheme.main16w600,
        ),
        const SizedBox(height: 9),
        Image(
          width: 24,
          height: 24,
          color: MyColors.whiteBackground,
          image: AssetImage(
              dataConversionHelpers.chooseIcon(hourly.weather[0].description)),
        ),
        const SizedBox(height: 4),
        Text(
            '${dataConversionHelpers.temperatureConversion(hourly.temp)}/${dataConversionHelpers.temperatureConversion(hourly.feelsLike)}',
            style: MyTheme.main12w400),
        Text('${dataConversionHelpers.rainConversion(hourly.pop)} rain',
            style: MyTheme.main12w400),
        const SizedBox(width: 72)
      ],
    );
  }
}
