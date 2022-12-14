import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
import 'package:aplikacja_pogodowa/widgets/weather_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);
  static const routeName = '/permission-page';
  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  void initState() {
    fetchLastOrInit();
    super.initState();
  }

  void fetchLastOrInit() {
    final provider = context.read<WeatherProvider>();

    if (provider.cities.isEmpty) {
      determinePosition();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        navigateToWeatherPage();
      });
    }
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
      //DodajPogode(laat,lon) tylko dodaje do cities
      await provider.addNewCityItem(value.latitude, value.longitude);

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
        await provider.addNewCityItem(value.latitude, value.longitude);
        navigateToWeatherPage();
      } catch (e) {
        provider.catchError();
      }
    }
  }

  void navigateToCityPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        SearchCityPage.routeName, (Route route) => false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 7),
        content: Text(
          'Lokalizacja wy????czona lub brak uprawnie??, wpisz miasto aby pobra?? pogod??!',
          style: MyTheme.snackBar14w400,
        ),
      ),
    );
  }

  void navigateToWeatherPage() {
    Navigator.of(context).popAndPushNamed(WeatherPage.routeName);
  }

  void onErrorFetchDataAgain() {
    final provider = context.read<WeatherProvider>();
    provider.resetErrorAndLoadings();
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    if (provider.isError) {
      return WeatherError(onPressed: onErrorFetchDataAgain);
    }
    return const Scaffold(
      body: SafeArea(
        child: WeatherBackgroundContainer(
          topPadding: 4,
          topRadius: 30,
          child: Center(
            child: CircularProgressIndicator(
              color: MyColors.textGreyCityItem,
            ),
          ),
        ),
      ),
    );
  }
}
