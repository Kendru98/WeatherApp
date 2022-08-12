import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/utils/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class SettingsProvider extends ChangeNotifier {
  static Box<Settings> settingsBox = Hive.box<Settings>('settings');

  Settings _currentSettings = settingsBox.get(
    0,
    defaultValue: Settings(
      temperature: 'celsius',
      wind: 'kmh',
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
    UserPreferences.init();
    if (value == MenuLanguage.english) {
      await UserPreferences.setLanguage('en');
      S.load(const Locale('en'));
    } else {
      await UserPreferences.setLanguage('pl');
      S.load(const Locale('pl'));
    }
    notifyListeners();
  }

  Future<void> addSetting(Settings temp) async {
    await settingsBox.clear();
    await settingsBox.add(temp);

    _currentSettings = temp;
    notifyListeners();
  }
}
