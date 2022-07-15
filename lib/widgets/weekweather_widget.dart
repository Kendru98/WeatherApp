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
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0)),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? Container(
              decoration: const BoxDecoration(
                color: MyColors.main2,
              ),
              child: SingleChildScrollView(
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
                        return SizedBox(
                          height: 48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Sun',
                                style: MyTheme.main16w500,
                              ),
                              Row(
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
                              Text(
                                '20/24',
                                style: MyTheme.main12w400,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forcast for 7 Days',
                    style: MyTheme.main16w500b,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Image(
                    width: 24,
                    height: 24,
                    color: MyColors.main1,
                    image: AssetImage(
                      'icons/arrowdownward.png',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
