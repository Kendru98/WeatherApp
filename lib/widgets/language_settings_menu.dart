import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';

enum MenuOptions { english, polish }

class LanguageSettingsMenu extends StatelessWidget {
  const LanguageSettingsMenu({Key? key}) : super(key: key);

  void actionPopUp(BuildContext context, MenuOptions value) {
    if (value == MenuOptions.english) {
      //TODO
    } else if (value == MenuOptions.polish) {
      //TODO
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
            value: MenuOptions.english,
            child: Text(
              'English',
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuOptions.polish,
            child: Text(
              'Polish',
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuOptions value) => actionPopUp(context, value),
      child: Text('English', style: MyTheme.settingsValue),
    );
  }
}
