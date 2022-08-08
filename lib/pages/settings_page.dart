import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/language_settings_menu.dart';
import 'package:aplikacja_pogodowa/widgets/temperature_settings_menu.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:aplikacja_pogodowa/widgets/wind_settings_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings-page';
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return SharedScaffold(
      title: 'Settings',
      body: WeatherBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UNIT',
                style: MyTheme.settingsTitle,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Temperature unit',
                    style: MyTheme.main16w400,
                  ),
                  TemperatureSettingsMenu(
                    currentValue: settingsProvider.currentSettings!.temperature,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wind speed unit',
                    style: MyTheme.main16w400,
                  ),
                  WindSettingsMenu(
                    currentValue: settingsProvider.currentSettings!.wind,
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'EXTRA',
                style: MyTheme.settingsTitle,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: MyTheme.main16w400,
                  ),
                  const LanguageSettingsMenu()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
