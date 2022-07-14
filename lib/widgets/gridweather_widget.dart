import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/theme.dart';

class WeatherGrid extends StatelessWidget {
  const WeatherGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.white,
                    size: 32,
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    FontAwesomeIcons.cloudRain,
                    color: Colors.white,
                    size: 32,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    FontAwesomeIcons.thermometer,
                    color: Colors.white,
                    size: 32,
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    FontAwesomeIcons.water, //bad possitioning why?
                    color: Colors.white,
                    size: 32,
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
                      'Humidity 83%',
                      style: MyTheme.main12w400,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
