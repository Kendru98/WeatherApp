import 'package:aplikacja_pogodowa/api/weather_api.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() async {
  await Settings.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => ApiProvider()))
        ],
        child: const MaterialApp(
          title: 'Aplikacja pogodowa',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          home: WeatherPage(),
        ));
  }
}
