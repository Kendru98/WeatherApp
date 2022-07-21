import 'package:aplikacja_pogodowa/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

isPermissionDenied() async {
  LocationPermission permission = await Geolocator.checkPermission();
  return permission;
}

Future<void> checkPermission(BuildContext context) async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    requestPermissions(context);
  } else if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    executeOnceAfterBuild(context);
  }
}

Future<void> requestPermissions(BuildContext context) async {
  await Geolocator.requestPermission();

  checkPermission(context);
}

Future<void> executeOnceAfterBuild(BuildContext context) async {
  final provider = Provider.of<ApiProvider>(context, listen: false);
  bool serviceEnabled;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
  } else {
    await Geolocator.getCurrentPosition()
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
