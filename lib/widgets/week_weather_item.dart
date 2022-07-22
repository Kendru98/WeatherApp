import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekWeatherItem extends StatelessWidget {
  const WeekWeatherItem({
    Key? key,
    required this.daily,
    required this.index,
  }) : super(key: key);
  final List<Daily> daily;
  final int index;
  @override
  Widget build(BuildContext context) {
    final DataConversionHelpers dataConversionHelpers = DataConversionHelpers();
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 17),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              index == 0
                  ? 'Today'
                  : DateFormat('E')
                      .format(DateTime.now().add(Duration(days: index))),
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
                    dataConversionHelpers
                        .chooseIcon(daily[index].weather[0].description),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${dataConversionHelpers.rainConversion(daily[index].pop)} rain',
                  style: MyTheme.main12w400,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${dataConversionHelpers.temperatureConversion(daily[index].temp.day)}/${dataConversionHelpers.temperatureConversion(daily[index].temp.day)}',
              style: MyTheme.main12w400,
            ),
          )
        ],
      ),
    );
  }
}
