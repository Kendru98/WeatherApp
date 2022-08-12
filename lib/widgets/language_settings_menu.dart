import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSettingsMenu extends StatelessWidget {
  const LanguageSettingsMenu({Key? key, required this.currentValue})
      : super(key: key);

  final String currentValue;
  void actionPopUp(BuildContext context, MenuLanguage value) {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.changeLanguage(value);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenu<MenuLanguage>(
      values: {
        MenuLanguage.polish: S.of(context).polish,
        MenuLanguage.english: S.of(context).english
      },
      currentValue: currentValue == MenuLanguage.polish.name
          ? MenuLanguage.polish
          : MenuLanguage.english,
      onSelected: (MenuLanguage value) => actionPopUp(context, value),
    );
  }
}
