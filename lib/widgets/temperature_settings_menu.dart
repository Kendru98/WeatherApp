import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemperatureSettingsMenu extends StatelessWidget {
  const TemperatureSettingsMenu({Key? key}) : super(key: key);

  void actionPopUp(BuildContext context, MenuTemperature value) {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.changeTemperature(value);
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    return PopupMenu<MenuTemperature>(
      values: const {
        MenuTemperature.celsius: 'Celsius',
        MenuTemperature.fahrenheit: 'Fahrenheit'
      },
      currentValue: settingsProvider.currentSettings.temperature ==
              MenuTemperature.celsius.name
          ? MenuTemperature.celsius
          : MenuTemperature.fahrenheit,
      onSelected: (MenuTemperature value) => actionPopUp(context, value),
    );
  }
}
