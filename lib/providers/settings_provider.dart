import 'package:aplikacja_pogodowa/models/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class SettingsProvider extends ChangeNotifier {
  Box<Settings> settingsBox = Hive.box<Settings>('settings');
  Settings? _currentSettings;
  Settings? get currentSettings => _currentSettings;

  SettingsProvider() {
    _currentSettings = settingsBox.get(
      0,
      defaultValue: Settings(
        language: 'english',
        wind: 'km/h',
        temperature: 'celsius',
      ),
    );
  }
  Future<void> changeTemperature(String value) async {
    Settings temp = _currentSettings!;
    temp.temperature = value;

    await addSetting(temp);
  }

  Future<void> changeWind(String value) async {
    Settings temp = _currentSettings!;
    temp.wind = value;

    await addSetting(temp);
  }

  Future<void> addSetting(Settings temp) async {
    await settingsBox.clear();
    await settingsBox.add(
      Settings(
        language: temp.language,
        wind: temp.wind,
        temperature: temp.temperature,
      ),
    );

    _currentSettings = settingsBox.get(0);
    notifyListeners();
  }
}
