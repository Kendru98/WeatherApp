import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum MenuWind { kmh, ms }

class WindSettingsMenu extends StatelessWidget {
  const WindSettingsMenu({Key? key, required this.currentValue})
      : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuWind value) {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.changeWind(value);
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
            value: MenuWind.kmh,
            child: Text(
              kmh,
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuWind.ms,
            child: Text(
              ms,
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuWind value) => actionPopUp(context, value),
      child: Text(
        currentValue == 'kmh' ? kmh : ms,
        style: MyTheme.settingsValue,
      ),
    );
  }
}
