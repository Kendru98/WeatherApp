import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';

class WeatherGrid extends StatelessWidget {
  const WeatherGrid({
    Key? key,
    required this.wind,
    required this.rainchance,
    required this.pressure,
    required this.humidity,
  }) : super(key: key);

  final String wind;
  final String rainchance;
  final String pressure;
  final String humidity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.whiteBackground,
                    image: AssetImage(
                      'icons/towind.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wind,
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        'Wind',
                        style: MyTheme.main12w400,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.whiteBackground,
                    image: AssetImage(
                      'icons/pressure.png',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pressure,
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        'Pressure',
                        style: MyTheme.main12w400,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.whiteBackground,
                    image: AssetImage(
                      'icons/fluent_weather-rain-24-filled.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rainchance,
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        'Chance of rain',
                        style: MyTheme.main12w400,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.whiteBackground,
                    image: AssetImage(
                      'icons/ion_water.png',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        humidity,
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        'Humidity $humidity',
                        style: MyTheme.main12w400,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
