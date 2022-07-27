import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/weather_error.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    final provider = context.read<WeatherProvider>();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      navigateToCityPage();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        navigateToCityPage();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      navigateToCityPage();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      Position? value = await Geolocator.getCurrentPosition();
      if (value == null) {
        getLastPosition();
      }
      await provider.initLocation(value.latitude, value.longitude);
      navigateToWeatherPage();
    } catch (e) {
      getLastPosition();
    }
  }

  Future<void> getLastPosition() async {
    final provider = context.read<WeatherProvider>();
    Position? value = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: true);
    if (value != null) {
      try {
        await provider.initLocation(value.latitude, value.longitude);
        navigateToWeatherPage();
      } catch (e) {
        provider.catchError();
      }
    }
  }

  void navigateToCityPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SearchCityPage()));
  }

  void navigateToWeatherPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WeatherPage()));
  }

  void onErrorFetchDataAgain() {
    final provider = context.read<WeatherProvider>();
    provider.loadAgain();
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    if (!provider.isError) {
      return const Scaffold(
        body: SafeArea(
          child: WeatherBackgroundContainer(
            topPadding: 8,
            topRadius: 30,
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.textGreyCityItem,
              ),
            ),
          ),
        ),
      );
    } else {
      return WeatherError(onPressed: onErrorFetchDataAgain);
    }
  }
}
