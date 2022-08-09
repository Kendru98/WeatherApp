import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/city_item.dart';
import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/pages/loading_page.dart';
import 'package:aplikacja_pogodowa/pages/permission_page.dart';
import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/pages/settings_page.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CityItemAdapter());
  Hive.registerAdapter(SettingsAdapter());
  await Hive.openBox<CityItem>('cities');
  await Hive.openBox<Settings>('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => S.of(context).appname, //notsureaboutit
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
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
