import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  void actionPopUp(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => actionPopUp(context),
      icon: const Image(
        color: MyColors.whiteBackground,
        image: AssetImage('icons/settings-ui.png'),
      ),
    );
  }
}
