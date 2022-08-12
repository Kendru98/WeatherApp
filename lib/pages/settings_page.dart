import 'package:aplikacja_pogodowa/generated/l10n.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/settings_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/language_settings_menu.dart';
import 'package:aplikacja_pogodowa/widgets/temperature_settings_menu.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:aplikacja_pogodowa/widgets/wind_settings_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings-page';

  Future<void> navigateToWeatherPage(BuildContext context) async {
    await Navigator.of(context).pushNamedAndRemoveUntil(
      WeatherPage.routeName,
      (Route route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    return WillPopScope(
      onWillPop: () async {
        await navigateToWeatherPage(context);
        return true;
      },
      child: SharedScaffold(
        title: S.of(context).settingsTitle,
        body: WeatherBackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).unit,
                  style: MyTheme.settingsTitle,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).temperatureUnit,
                      style: MyTheme.main16w400,
                    ),
                    TemperatureSettingsMenu(
                      currentValue:
                          settingsProvider.currentSettings.temperature,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).windSpeedUnit,
                      style: MyTheme.main16w400,
                    ),
                    WindSettingsMenu(
                      currentValue: settingsProvider.currentSettings.wind,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).extra,
                  style: MyTheme.settingsTitle,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).language,
                      style: MyTheme.main16w400,
                    ),
                    LanguageSettingsMenu(
                      currentValue: Intl.getCurrentLocale() == 'en'
                          ? 'english'
                          : 'polish',
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'App design inspired by Ihza Creative - ',
                        style: MyTheme.main16w400,
                      ),
                      TextSpan(
                        text: 'Licence CC4.0',
                        style: MyTheme.main16w400Link,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse(
                                'https://creativecommons.org/licenses/by/4.0/',
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
