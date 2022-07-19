import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/weathericons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyList extends StatelessWidget {
  const HourlyList({Key? key, required this.hourly, required this.index})
      : super(key: key);

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
            '${hourly[index].temp.toInt() - 273.14.ceil()}°/${hourly[index].feels_like.toInt() - 273.14.ceil()}°',
            style: MyTheme.main12w400),
        Text('${((hourly[index].pop ?? 0) * 100).ceil()}% rain',
            style: MyTheme.main12w400),
        const SizedBox(width: 72)
      ],
    );
  }
}
