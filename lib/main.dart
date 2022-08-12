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
import 'package:aplikacja_pogodowa/utils/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl_standalone.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CityItemAdapter());
  Hive.registerAdapter(SettingsAdapter());
  await Hive.openBox<CityItem>('cities');
  await Hive.openBox<Settings>('settings');
  await UserPreferences.init().then(
    (preferences) {
      findSystemLocale();
      String currentLanguage =
          UserPreferences.getLanguage() ?? Intl.systemLocale.substring(0, 2);

      return runApp(
        MyApp(userLanguage: currentLanguage),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userLanguage});

  final String userLanguage;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale(userLanguage),
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
