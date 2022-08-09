import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSettingsMenu extends StatelessWidget {
  const LanguageSettingsMenu({Key? key}) : super(key: key);

  void actionPopUp(BuildContext context, MenuLanguage value) {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    return PopupMenu<MenuLanguage>(
      values: const {
        MenuLanguage.polish: 'polish',
        MenuLanguage.english: 'english'
      },
      currentValue:
          settingsProvider.currentSettings.language == MenuLanguage.polish.name
              ? MenuLanguage.polish
              : MenuLanguage.english,
      onSelected: (MenuLanguage value) => actionPopUp(context, value),
    );
  }
}
