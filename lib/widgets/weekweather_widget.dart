import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constans.dart';
import '../theme/theme.dart';

class SevenDayWidget extends StatefulWidget {
  SevenDayWidget({Key? key}) : super(key: key);
  //provider.currentweather.daily
  @override
  State<SevenDayWidget> createState() => _SevenDayWidgetState();
}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? Container(
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
                    //consumer
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
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
                                const Icon(Icons.cloud,
                                    color: Colors.white, size: 24),
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
                  const Icon(
                    FontAwesomeIcons.anglesDown,
                    color: MyColors.main2,
                    size: 24,
                  ),
                ],
              ),
            ),
    );
  }
}
