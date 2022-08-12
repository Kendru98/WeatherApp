import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return PopupMenu<MenuTemperature>(
      values: {
        MenuTemperature.celsius: S.of(context).unitC,
        MenuTemperature.fahrenheit: S.of(context).unitF
      },
      currentValue: currentValue == MenuTemperature.celsius.name
          ? MenuTemperature.celsius
          : MenuTemperature.fahrenheit,
      onSelected: (MenuTemperature value) => actionPopUp(context, value),
    );
  }
}
