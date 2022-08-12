import 'package:aplikacja_pogodowa/pages/settings_page.dart';
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
      icon: const Icon(
        Icons.settings,
        size: 26,
      ),
    );
  }
}
