import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({Key? key, required this.onPressed}) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WeatherBackgroundContainer(
          topPadding: 8,
          topRadius: 30,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wystąpił błąd, spróbuj pobrać dane ponownie',
                  textAlign: TextAlign.center,
                  style: MyTheme.main16w600,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: MyColors.mainDark,
                    elevation: 0,
                    padding: const EdgeInsets.all(4),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    'Pobierz dane',
                    style: MyTheme.main16w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
