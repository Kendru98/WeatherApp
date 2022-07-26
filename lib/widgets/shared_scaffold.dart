import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/widgets/weather_appbar.dart';
import 'package:flutter/material.dart';

class SharedScaffold extends StatelessWidget {
  const SharedScaffold({super.key, required this.title, required this.body});

  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteBackground,
      resizeToAvoidBottomInset: false,
      appBar: WeatherAppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.whiteBackground,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: body,
    );
  }
}
