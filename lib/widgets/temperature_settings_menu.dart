import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum MenuOptions { celsius, fahrenheit }

class TemperatureSettingsMenu extends StatelessWidget {
  const TemperatureSettingsMenu({Key? key, required this.currentValue})
      : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuOptions value) {
    final settingsProvider = context.read<SettingsProvider>();
    if (value == MenuOptions.celsius) {
      settingsProvider.changeTemperature(value.name);
    } else if (value == MenuOptions.fahrenheit) {
      settingsProvider.changeTemperature(value.name);
    }
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
            value: MenuOptions.celsius,
            child: Text(
              'Celsius',
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuOptions.fahrenheit,
            child: Text(
              'Fahrenheit',
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuOptions value) => actionPopUp(context, value),
      child: Text(currentValue, style: MyTheme.settingsValue),
    );
  }
}
