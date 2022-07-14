import 'package:flutter/material.dart';

import '../constans.dart';
import '../theme/theme.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 9, left: 16),
      height: 140, //error?
      color: MyColors.main2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sunday',
                style: MyTheme.main16w600,
              ),
              const Padding(padding: EdgeInsets.only(right: 8)),
              const SizedBox(
                height: 19,
                child: VerticalDivider(
                  color: MyColors.white,
                  width: 2,
                  thickness: 2,
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(
                'Nov 14',
                style: MyTheme.main16w600,
              ),
            ],
          ),
          SizedBox(
              height: 104, // error

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 11,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Now',
                        style: MyTheme.main16w500,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      const Icon(
                        Icons.cloudy_snowing,
                        size: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '20°/24°',
                        style: MyTheme.main12w400,
                      ),
                      Text(
                        '74% rain',
                        style: MyTheme.main12w400,
                      ),
                      const SizedBox(
                        width: 72,
                      )
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
