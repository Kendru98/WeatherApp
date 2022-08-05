import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_item.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
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

  void wrongCityDialog(String city) {
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

  void addCityItem(Location location, String city) async {
    final provider = context.read<WeatherProvider>();
    await provider.addNewWeatherItem(location.latitude, location.longitude);
    navigateToWeatherPage();
  }

  void navigateToWeatherPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      WeatherPage.routeName,
      (Route route) => false,
    );
  }

  void onSubmittedCity(BuildContext context, String city) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final provider = context.read<WeatherProvider>();
    final Location? location = await provider.isCityExistAndInit(city);
    if (location == null) {
      wrongCityDialog(city);
    } else {
      addCityItem(location, city);
    }
    _givenCityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return SharedScaffold(
        title: 'Manage Location',
        body: WeatherBackgroundContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                child: ListView.builder(
                  itemCount: provider.cities.length,
                  itemBuilder: (context, cityIndex) {
                    return CitiesHistoryItem(
                      weatherItem: provider.cities[cityIndex],
                      cityIndex: cityIndex,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
