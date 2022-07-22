import 'package:geolocator/geolocator.dart';

class LocalizationPermissions {
  Future<bool> isPermissionAllow() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
      // return Future.error('Location services are disabled.');

      //Navigator to city page
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
        // Future.error('Location permissions are denied');
        //Navigator to city page
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
      // Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
      //Navigator to city pag
    }
    return true;
  }
}
