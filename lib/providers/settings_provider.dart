import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:aplikacja_pogodowa/widgets/temperature_settings_menu.dart';
import 'package:aplikacja_pogodowa/widgets/wind_settings_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

enum Temperature { celsius, fahrenheit }

enum Wind { celsius, fahrenheit }

class SettingsProvider extends ChangeNotifier {
  Box<Settings> settingsBox = Hive.box<Settings>('settings');
  late Settings _currentSettings;
  Settings get currentSettings => _currentSettings;

  SettingsProvider() {
    _currentSettings = settingsBox.get(
      0,
      defaultValue: Settings(
        language: 'english',
        wind: 'km/h',
        temperature: 'celsius',
      ),
    )!;
  }
  Future<void> changeTemperature(MenuTemperature value) async {
    Settings temp = _currentSettings;

    await addSetting(temp.copyWith(temperature: value.name));
  }

  Future<void> changeWind(MenuWind value) async {
    Settings temp = _currentSettings;

    await addSetting(temp.copyWith(wind: value.name));
  }

  Future<void> addSetting(Settings temp) async {
    await settingsBox.clear();
    await settingsBox.add(temp);

    _currentSettings = settingsBox.get(0)!;
    notifyListeners();
  }
}
