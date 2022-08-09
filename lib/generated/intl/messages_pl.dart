// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appname": MessageLookupByLibrary.simpleMessage("Aplikacja pogodowa"),
        "chanceOfRain": MessageLookupByLibrary.simpleMessage("Szansa opadów"),
        "cityPageHint":
            MessageLookupByLibrary.simpleMessage("Wyszukaj swoje miasto"),
        "cityPageTitle":
            MessageLookupByLibrary.simpleMessage("Zarządzaj lokalizacją"),
        "citysearchError": MessageLookupByLibrary.simpleMessage(
            "Wpisz prawidłową nazwę miasta lub sprawdź połączenie internetowe!"),
        "extra": MessageLookupByLibrary.simpleMessage("EXTRA"),
        "humidity": MessageLookupByLibrary.simpleMessage("Wilgotność"),
        "language": MessageLookupByLibrary.simpleMessage("Język"),
        "localizationError": MessageLookupByLibrary.simpleMessage(
            "Lokalizacja wyłączona lub brak uprawnień, wprowadź miasto, aby pobrać pogodę!"),
        "nowDay": MessageLookupByLibrary.simpleMessage("Dziś"),
        "nowHoursWidget": MessageLookupByLibrary.simpleMessage("Teraz"),
        "pressure": MessageLookupByLibrary.simpleMessage("Ciśnienie"),
        "rain": MessageLookupByLibrary.simpleMessage("opady"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Ustawienia"),
        "share": MessageLookupByLibrary.simpleMessage("Udostępnij"),
        "temperatureUnit":
            MessageLookupByLibrary.simpleMessage("Jednostka temperatury"),
        "unit": MessageLookupByLibrary.simpleMessage("JEDNOSTKA"),
        "unitC": MessageLookupByLibrary.simpleMessage("Celsjusz"),
        "unitF": MessageLookupByLibrary.simpleMessage("Farenhajt"),
        "weekWeatherTitle":
            MessageLookupByLibrary.simpleMessage("Pogoda na 7 dni"),
        "wind": MessageLookupByLibrary.simpleMessage("Wiatr"),
        "windSpeedUnit":
            MessageLookupByLibrary.simpleMessage("Jednostka prędkości wiatru")
      };
}
