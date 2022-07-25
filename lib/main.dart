import 'package:aplikacja_pogodowa/pages/permission_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WeatherProvider())
        ],
        child: const MaterialApp(
          title: 'Aplikacja pogodowa',
          home: PermissionPage(),
        ));
  }
}
