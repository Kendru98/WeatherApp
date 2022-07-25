import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider_and_data_handling.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_item.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({Key? key}) : super(key: key);

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  @override
  void dispose() {
    givenCityController.dispose();

    super.dispose();
  }

  void wrongCityDialog(BuildContext context, String city) {
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

  addCityItem(String city, BuildContext context) async {
    final provider =
        Provider.of<ApiProviderAndDataHandling>(context, listen: false);
    final WeatherItem? returnIfExist = provider.returnIfExist(city);
    final int citiesListLength = provider.cities.length;

    if (returnIfExist != null && citiesListLength <= 5) {
      WeatherItem existItem = returnIfExist;
      provider.fetchData(existItem.lat, existItem.lat);

      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const WeatherPage())));
    } else if (citiesListLength == 5 && returnIfExist == null) {
      provider.cities.removeAt(0);
      provider.cityToCoords(city);
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const WeatherPage())));
    } else {
      provider.cityToCoords(city);
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const WeatherPage())));
    }
  }

  onSubmittedCity(String city, context) async {
    final provider =
        Provider.of<ApiProviderAndDataHandling>(context, listen: false);
    if (await provider.cityNameCheck(city) == false) {
      wrongCityDialog(context, city);
      givenCityController.clear();
    } else {
      addCityItem(city, context);

      givenCityController.clear();
    }
  }

  final givenCityController = TextEditingController();
  final focusNodeCity = FocusNode();

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
                focusNode: focusNodeCity,
                controller: givenCityController,
                onSubmitted: (city) => onSubmittedCity(city, context),
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
              child: Selector<ApiProviderAndDataHandling, List<WeatherItem>>(
                selector: (_, provider) => provider.cities,
                builder: (context, cityList, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cityList.length,
                    itemBuilder: (context, index) {
                      return CitiesHistoryItem(
                        weatherItem: cityList[index],
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
