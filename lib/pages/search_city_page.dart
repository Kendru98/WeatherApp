import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_item.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({Key? key}) : super(key: key);
  static const routeName = '/search-city-page';
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 7),
        content: Text(
          'Wpisz poprawną nazwę miasta, lub sprawdź swoje połączenie z internetem!',
          style: MyTheme.snackBar14w400,
        ),
      ),
    );
  }

  void addCityItem(BuildContext context, String city) async {
    final provider = context.read<WeatherProvider>();

    provider.fetchData();
    Navigator.of(context).pushNamedAndRemoveUntil(
      WeatherPage.routeName,
      (Route route) => false,
    );
  }

  void onSubmittedCity(BuildContext context, String city) async {
    final provider = context.read<WeatherProvider>();
    if (await provider.cityCheckAndInit(city) == false) {
      wrongCityDialog(context, city);
    } else {
      addCityItem(context, city);
    }
    _givenCityController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
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
                  bool isFirst = false;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: cityList.length,
                    itemBuilder: (context, index) {
                      index == 0 ? isFirst = true : isFirst = false;
                      return CitiesHistoryItem(
                        weatherItem: cityList[index],
                        isFirst: isFirst,
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
