import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
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
  final _givenCityController = TextEditingController();

  @override
  void dispose() {
    _givenCityController.dispose();
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

  void addCityItem(BuildContext context, String city) async {
    final provider = context.read<WeatherProvider>();
    final WeatherItem? returnIfExist = provider.getByCityCoords(
      provider.lat,
      provider.lon,
    );
    final int citiesListLength = provider.cities.length;

    if (returnIfExist != null && citiesListLength <= 5) {
      WeatherItem existItem = returnIfExist;
      provider.fetchData(existItem.lat, existItem.lon);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WeatherPage(),
        ),
      );
    } else if (citiesListLength == 5 && returnIfExist == null) {
      provider.cities.removeAt(0);
      provider.fetchDataByCityName(city);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WeatherPage(),
        ),
      );
    } else {
      provider.fetchDataByCityName(city);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WeatherPage(),
        ),
      );
    }
  }

  void onSubmittedCity(
    BuildContext context,
    String city,
  ) async {
    final provider = Provider.of<WeatherProvider>(context, listen: false);
    if (await provider.cityNameCheck(city) == false) {
      wrongCityDialog(context, city);
      _givenCityController.clear();
    } else {
      addCityItem(context, city);

      _givenCityController.clear();
    }
  }

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
                controller: _givenCityController,
                onSubmitted: (city) => onSubmittedCity(context, city),
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
              child: Selector<WeatherProvider, List<WeatherItem>>(
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
