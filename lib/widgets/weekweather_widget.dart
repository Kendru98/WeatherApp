import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constans.dart';
import '../utils/theme.dart';

class SevenDayWidget extends StatefulWidget {
  const SevenDayWidget({Key? key}) : super(key: key);

  @override
  State<SevenDayWidget> createState() => _SevenDayWidgetState();
}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MyColors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? Container(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: MyColors.main2,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forcast for 7 Days',
                          style: MyTheme.main16w500,
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 17),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Sun',
                                  style: MyTheme.main16w500,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    const Image(
                                      width: 24,
                                      height: 24,
                                      color: MyColors.white,
                                      image: AssetImage(
                                        'icons/fluent_weather-rain-showers-day-24-filled.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '74% rain',
                                      style: MyTheme.main12w400,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '20/24',
                                  style: MyTheme.main12w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forecast for 7 Days',
                  style: MyTheme.main16w500b,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Image(
                  width: 24,
                  height: 24,
                  color: MyColors.main2,
                  image: AssetImage(
                    'icons/arrowdownward.png',
                  ),
                ),
              ],
            ),
    );
  }
}
