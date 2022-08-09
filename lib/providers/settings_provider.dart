import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class SettingsProvider extends ChangeNotifier {
  static Box<Settings> settingsBox = Hive.box<Settings>('settings');

  Settings _currentSettings = settingsBox.get(
    0,
    defaultValue: Settings(
      temperature: 'celsius',
      wind: 'kmh',
      language: Intl.getCurrentLocale() == 'en' ? 'english' : 'polish',
    ),
  )!;

  Settings get currentSettings => _currentSettings;

  Future<void> changeTemperature(MenuTemperature value) async {
    await addSetting(_currentSettings.copyWith(temperature: value.name));
  }

  Future<void> changeWind(MenuWind value) async {
    await addSetting(_currentSettings.copyWith(wind: value.name));
  }

  Future<void> changeLanguage(MenuLanguage value) async {
    value.name == 'english'
        ? S.load(const Locale('en'))
        : S.load(const Locale('pl'));
    await addSetting(_currentSettings.copyWith(language: value.name));
  }

  Future<void> addSetting(Settings temp) async {
    await settingsBox.clear();
    await settingsBox.add(temp);

    _currentSettings = temp;
    notifyListeners();
  }
}
