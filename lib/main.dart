import 'package:aplikacja_pogodowa/pages/weather_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ((context, child) => SafeArea(child: child!)),
      title: 'Aplikacja pogodowa',
      home: const WeatherPage(),
    );
  }
}
