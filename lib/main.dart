import 'package:aplikacja_pogodowa/pages/weather_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplikacja pogodowa',
      home: WeatherPage(),
    );
  }
}
