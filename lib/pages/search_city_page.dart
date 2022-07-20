import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_item.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchCityPage extends StatelessWidget {
  const SearchCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: 'Manage Location',
      body: WeatherBackgroundContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(FontAwesomeIcons.searchengin),
                  fillColor: MyColors.textFieldFill,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search Your City',
                  hintStyle: MyTheme.city12g,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const CitiesHistoryItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
