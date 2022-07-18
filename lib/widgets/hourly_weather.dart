import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/hourly_list.dart';
import 'package:flutter/material.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({
    Key? key,
  }) : super(key: key);

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
                'Sunday',
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
                'Nov 14',
                style: MyTheme.main16w600,
              ),
            ],
          ),
          SizedBox(
            height: 104,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                return const HourlyList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
