// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appname": MessageLookupByLibrary.simpleMessage("Weather app"),
        "chanceOfRain": MessageLookupByLibrary.simpleMessage("Chance of rain"),
        "cityPageHint":
            MessageLookupByLibrary.simpleMessage("Search Your City"),
        "cityPageTitle":
            MessageLookupByLibrary.simpleMessage("Manage Location"),
        "citysearchError": MessageLookupByLibrary.simpleMessage(
            "Enter the correct city name, or check your internet connection!"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "extra": MessageLookupByLibrary.simpleMessage("EXTRA"),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "licenses": MessageLookupByLibrary.simpleMessage("Licences"),
        "localizationError": MessageLookupByLibrary.simpleMessage(
            "Location disabled or no permissions, enter city to download weather!"),
        "nowDay": MessageLookupByLibrary.simpleMessage("Today"),
        "nowHoursWidget": MessageLookupByLibrary.simpleMessage("Now"),
        "polish": MessageLookupByLibrary.simpleMessage("Polish"),
        "pressure": MessageLookupByLibrary.simpleMessage("Pressure"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "rain": MessageLookupByLibrary.simpleMessage("rain"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "shareScreenshotError": MessageLookupByLibrary.simpleMessage(
            "Error while sharing, try again!"),
        "temperatureUnit":
            MessageLookupByLibrary.simpleMessage("Temperature unit"),
        "unit": MessageLookupByLibrary.simpleMessage("UNIT"),
        "unitC": MessageLookupByLibrary.simpleMessage("Celsius"),
        "unitF": MessageLookupByLibrary.simpleMessage("Fahrenheit"),
        "weekWeatherTitle":
            MessageLookupByLibrary.simpleMessage("Forecast for 7 Days"),
        "wind": MessageLookupByLibrary.simpleMessage("Wind"),
        "windSpeedUnit": MessageLookupByLibrary.simpleMessage("Wind speed unit")
      };
}
