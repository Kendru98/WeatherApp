import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum MenuOptions { kmh, ms }

class WindSettingsMenu extends StatelessWidget {
  const WindSettingsMenu({Key? key, required this.currentValue})
      : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuOptions value) {
    final settingsProvider = context.read<SettingsProvider>();
    if (value == MenuOptions.kmh) {
      settingsProvider.changeWind(value.name);
    } else if (value == MenuOptions.ms) {
      settingsProvider.changeWind(value.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    const String kmh = 'km/h';
    const String ms = 'm/s';
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: MenuOptions.kmh,
            child: Text(
              kmh,
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuOptions.ms,
            child: Text(
              ms,
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuOptions value) => actionPopUp(context, value),
      child: Text(
        currentValue == 'kmh' ? kmh : ms,
        style: MyTheme.settingsValue,
      ),
    );
  }
}
