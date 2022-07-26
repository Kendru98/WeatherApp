import 'package:aplikacja_pogodowa/models/current.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/hourly_weather_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({
    Key? key,
    required this.hourly,
  }) : super(key: key);
  final List<Current> hourly;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.mainDark,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: MyTheme.main16w600,
              ),
              const SizedBox(width: 8),
              const SizedBox(
                height: 19,
                child: VerticalDivider(
                  color: MyColors.whiteBackground,
                  width: 2,
                  thickness: 2,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat('MMM d').format(DateTime.now()),
                style: MyTheme.main16w600,
              ),
            ],
          ),
          SizedBox(
            height: 104,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: hourly.length,
              itemBuilder: (context, index) {
                return HourlyWeatherItem(
                  hourly: hourly[index],
                  hourIndex: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
