import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';

enum MenuOptions { share, settings }

class HomepageMenu extends StatelessWidget {
  const HomepageMenu({
    Key? key,
  }) : super(key: key);
  void actionPopUp(BuildContext context, MenuOptions value) {
    if (value == MenuOptions.share) {
      //TODO
    } else if (value == MenuOptions.settings) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const SettingsPage(),
        ),
      );
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
            value: MenuOptions.share,
            child: Text(
              S.of(context).share,
              style: MyTheme.popmenutext,
            ),
          ),
          PopupMenuItem(
            value: MenuOptions.settings,
            child: Text(
              S.of(context).settingsTitle,
              style: MyTheme.popmenutext,
            ),
          ),
        ];
      },
      onSelected: (MenuOptions value) => actionPopUp(context, value),
      icon: const Image(
        width: 32,
        height: 32,
        color: MyColors.whiteBackground,
        image: AssetImage(
          'icons/carbon_overflow-menu-vertical.png',
        ),
      ),
    );
  }
}
