import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';

enum MenuLanguage { english, polish }

class LanguageSettingsMenu extends StatelessWidget {
  const LanguageSettingsMenu({Key? key}) : super(key: key);

  void actionPopUp(BuildContext context, MenuLanguage value) {
    //todo
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
            value: MenuLanguage.english,
            child: Text(
              'English',
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuLanguage.polish,
            child: Text(
              'Polish',
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuLanguage value) => actionPopUp(context, value),
      child: Text('English', style: MyTheme.settingsValue),
    );
  }
}
