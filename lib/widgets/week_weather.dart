import 'package:aplikacja_pogodowa/models/daily.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/weathericons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SevenDayWidget extends StatefulWidget {
  const SevenDayWidget({Key? key, required this.daily}) : super(key: key);

  final List<Daily> daily;
  @override
  State<SevenDayWidget> createState() => _SevenDayWidgetState();
}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        primary: MyColors.whiteBackground,
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
                color: MyColors.mainDark,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.daily.length,
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
                                  index == 0
                                      ? 'Today'
                                      : DateFormat('E').format(
                                          DateTime.now().add(
                                            Duration(days: index),
                                          ),
                                        ),
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
                                        chooseIcon(widget.daily[index]
                                            .weather[0].description),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${((widget.daily[index].pop ?? 0) * 100).ceil()}% rain',
                                      style: MyTheme.main12w400,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${(widget.daily[index].temp.day.toInt() - 273.14).ceil()}°/${(widget.daily[index].temp.day.toInt() - 273.14).ceil()}°',
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
          : Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: Column(
                children: [
                  Row(
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
                        color: MyColors.mainDark,
                        image: AssetImage(
                          'icons/arrowdownward.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
