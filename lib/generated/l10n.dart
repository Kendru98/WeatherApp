// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Weather app`
  String get appname {
    return Intl.message(
      'Weather app',
      name: 'appname',
      desc: '',
      args: [],
    );
  }

  /// `Location disabled or no permissions, enter city to download weather!`
  String get localizationError {
    return Intl.message(
      'Location disabled or no permissions, enter city to download weather!',
      name: 'localizationError',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct city name, or check your internet connection!`
  String get citysearchError {
    return Intl.message(
      'Enter the correct city name, or check your internet connection!',
      name: 'citysearchError',
      desc: '',
      args: [],
    );
  }

  /// `Manage Location`
  String get cityPageTitle {
    return Intl.message(
      'Manage Location',
      name: 'cityPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search Your City`
  String get cityPageHint {
    return Intl.message(
      'Search Your City',
      name: 'cityPageHint',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message(
      'Wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `Chance of rain`
  String get chanceOfRain {
    return Intl.message(
      'Chance of rain',
      name: 'chanceOfRain',
      desc: '',
      args: [],
    );
  }

  /// `Pressure`
  String get pressure {
    return Intl.message(
      'Pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get nowHoursWidget {
    return Intl.message(
      'Now',
      name: 'nowHoursWidget',
      desc: '',
      args: [],
    );
  }

  /// `rain`
  String get rain {
    return Intl.message(
      'rain',
      name: 'rain',
      desc: '',
      args: [],
    );
  }

  /// `Forecast for 7 Days`
  String get weekWeatherTitle {
    return Intl.message(
      'Forecast for 7 Days',
      name: 'weekWeatherTitle',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get nowDay {
    return Intl.message(
      'Today',
      name: 'nowDay',
      desc: '',
      args: [],
    );
  }

  /// `UNIT`
  String get unit {
    return Intl.message(
      'UNIT',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `EXTRA`
  String get extra {
    return Intl.message(
      'EXTRA',
      name: 'extra',
      desc: '',
      args: [],
    );
  }

  /// `Temperature unit`
  String get temperatureUnit {
    return Intl.message(
      'Temperature unit',
      name: 'temperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Wind speed unit`
  String get windSpeedUnit {
    return Intl.message(
      'Wind speed unit',
      name: 'windSpeedUnit',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Celsius`
  String get unitC {
    return Intl.message(
      'Celsius',
      name: 'unitC',
      desc: '',
      args: [],
    );
  }

  /// `Fahrenheit`
  String get unitF {
    return Intl.message(
      'Fahrenheit',
      name: 'unitF',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
