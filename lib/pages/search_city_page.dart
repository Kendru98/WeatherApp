import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_item.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchCityPage extends StatelessWidget {
  SearchCityPage({Key? key}) : super(key: key);
  wrongCityDialog(BuildContext context, String city) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nie mogę wyszukać miasta: $city'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        );
      },
    );
  }

  addCityItem(String city, BuildContext context, ApiProvider provider) async {
    if (provider.ifCityExist(provider.city) == WeatherItem &&
        provider.cityList.length <= 5) {
      WeatherItem existItem = provider.ifCityExist(city);
      provider.fetchData(existItem.lat, existItem.lat);

      Navigator.pop(context);
    } else if (provider.cityList.length == 5 &&
        provider.ifCityExist(city) == null) {
      provider.cityList.removeAt(0);
      provider.cityToCoords(city);
      Navigator.pop(context);
    } else {
      provider.cityToCoords(city); //jezeli to to dodaj do listy
      Navigator.pop(context);
    }
  }

  final givenCityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context, listen: false);
    return SharedScaffold(
      title: 'Manage Location',
      body: WeatherBackgroundContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: givenCityController,
                onSubmitted: (String city) async {
                  if (await provider.cityNameCheck(city) == 'error') {
                    wrongCityDialog(context, city);
                    givenCityController.clear();
                  } else {
                    addCityItem(city, context, provider);
                    givenCityController.clear();
                  }
                },
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
            Consumer<ApiProvider>(
              builder: ((context, providercity, child) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: providercity.cityList.length,
                    itemBuilder: (context, index) {
                      return CitiesHistoryItem(
                          weatherItem: providercity.cityList[index],
                          index: index);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
