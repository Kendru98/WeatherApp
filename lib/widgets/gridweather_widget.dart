import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

//

class WeatherGrid extends StatelessWidget {
  const WeatherGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.white,
                    image: AssetImage(
                      'icons/towind.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3,7 km/h',
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
              const SizedBox(width: 74),
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.white,
                    image: AssetImage(
                      'icons/rain.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '74%',
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
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.white,
                    image: AssetImage(
                      'icons/pressure.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1010 mbar',
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
              const SizedBox(width: 66),
              Row(
                children: [
                  const Image(
                    width: 32,
                    height: 32,
                    color: MyColors.white,
                    image: AssetImage(
                      'icons/hum_outline.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '83%',
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        'Humidity 83%  ',
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
