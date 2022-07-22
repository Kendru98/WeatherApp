import 'package:aplikacja_pogodowa/pages/search_city_page.dart';
import 'package:aplikacja_pogodowa/pages/weather_page.dart';
import 'package:aplikacja_pogodowa/providers/api_provider_and_data_handling.dart';
import 'package:aplikacja_pogodowa/widgets/weather_background_container.dart';
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
    _determinePosition();
    super.initState();
  }

  Future<void> _determinePosition() async {
    final provider =
        Provider.of<ApiProviderAndDataHandling>(context, listen: false);
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => SearchCityPage())));
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => SearchCityPage())));
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => SearchCityPage())));
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.lowest,
    )
        .then(
          (value) => {
            provider.initLocation(value),
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const WeatherPage())))
          },
        )
        .onError((error, stackTrace) => {
              Geolocator.getLastKnownPosition(forceAndroidLocationManager: true)
                  .then((value) => {provider.initLocation(value!)})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherBackgroundContainer(
        child: Column(),
      ),
    );
  }
}
 // Future executeOnceAfterBuild() async {
  //   final provider =
  //       Provider.of<ApiProviderAndDataHandling>(context, listen: false);
  //   bool serviceEnabled;
  //   var buttonclicked = false;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('Włącz lokalizację aby pobrać dane'),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     buttonclicked = true;
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: const Text('Ok'))
  //             ],
  //           );
  //         });
  //     await Future.delayed(const Duration(seconds: 10));
  //     if (buttonclicked) {
  //       executeOnceAfterBuild();
  //     }
  //   } else {
  // Geolocator.getCurrentPosition(
  //   desiredAccuracy: LocationAccuracy.lowest,
  // )
  //     .then(
  //       (value) => {
  //         provider.initLocation(value),
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: ((context) => const WeatherPage())))
  //       },
  //     )
  //     .onError((error, stackTrace) => {
  //           Geolocator.getLastKnownPosition(
  //                   forceAndroidLocationManager: true)
  //               .then((value) => {provider.initLocation(value!)})
  //         });
  //}

  // Future<void> checkPermission() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     await Geolocator.requestPermission();
  //   }
  //   if (permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse) {
  //     w
  //   } else {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: ((context) => SearchCityPage())));
  //   }
  // }