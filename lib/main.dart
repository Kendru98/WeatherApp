import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/loading_page.dart';
import 'package:aplikacja_pogodowa/pages/permission_page.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherItemAdapter());
  await Hive.openBox<WeatherItem>('cities');

  //register adapter nad open box
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
      child: MaterialApp(
        title: 'Aplikacja pogodowa',
        home: const PermissionPage(),
        routes: {
          LoadingScreen.routeName: (context) => const LoadingScreen(),
          PermissionPage.routeName: (context) => const PermissionPage(),
          SearchCityPage.routeName: (context) => const SearchCityPage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          WeatherPage.routeName: (context) => const WeatherPage(),
        },
      ),
    );
  }
}
