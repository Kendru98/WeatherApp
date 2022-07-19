import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

Future<void> checkPermission(BuildContext context) async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    requestPermissions(context);
  } else if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        executeOnceAfterBuild(context);
      },
    );
  }
}

Future<void> requestPermissions(BuildContext context) async {
  await Geolocator.requestPermission();
  // ignore: use_build_context_synchronously
  checkPermission(context);
}

Future<void> executeOnceAfterBuild(BuildContext context) async {
  final provider = Provider.of<ApiProvider>(context, listen: false);
  bool serviceEnabled;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Włącz lokalizację aby pobrać dane'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  } else {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
            // forceAndroidLocationManager: true,
            timeLimit: const Duration(seconds: 5))
        .then((value) => {provider.initLocation(value)})
        .onError(
          (error, stackTrace) => {
            Geolocator.getLastKnownPosition(forceAndroidLocationManager: true)
                .then(
              (value) => {
                provider.initLocation(value!),
              },
            ),
          },
        );
  }
}
