import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum MenuTemperature { celsius, fahrenheit }

class TemperatureSettingsMenu extends StatelessWidget {
  const TemperatureSettingsMenu({Key? key, required this.currentValue})
      : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuTemperature value) {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.changeTemperature(value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: MenuTemperature.celsius,
            child: Text(
              'Celsius',
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuTemperature.fahrenheit,
            child: Text(
              'Fahrenheit',
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuTemperature value) => actionPopUp(context, value),
      child: Text(currentValue, style: MyTheme.settingsValue),
    );
  }
}
