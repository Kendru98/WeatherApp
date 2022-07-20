import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: 'Settings',
      body: WeatherBackgroundContainer(
        child: Column(
          children: [
            Row(
                //TODO
                )
          ],
        ),
      ),
    );
  }
}
