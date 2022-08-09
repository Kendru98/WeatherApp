import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WindSettingsMenu extends StatelessWidget {
  const WindSettingsMenu({
    Key? key,
    required this.currentValue,
  }) : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuWind value) {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.changeWind(value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenu<MenuWind>(
      values: const {MenuWind.kmh: 'km/h', MenuWind.ms: 'm/s'},
      currentValue:
          currentValue == MenuWind.kmh.name ? MenuWind.kmh : MenuWind.ms,
      onSelected: (MenuWind value) => actionPopUp(context, value),
    );
  }
}
