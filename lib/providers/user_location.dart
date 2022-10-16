import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class UserLocationProvider extends ChangeNotifier {
  static UserLocationProvider state(BuildContext context) =>
      Provider.of<UserLocationProvider>(context, listen: false);
  // picked location
  bool locationEnabled = false;
  LocationPermission? locationPermission;
  LatLng? userLocation;
  LatLng? currentLocation;

  String? placeId;
  String? localArea;
  LatLng? localAreaCords;
  String? city;
  String? location;
  LatLng? latLng;
  LatLng? pickedLatLng;
  Future<void> getUserLocation() async {
    locationEnabled = await Geolocator.isLocationServiceEnabled();

    if (locationEnabled) {
      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();

        if (locationPermission == LocationPermission.deniedForever) {
          await Geolocator.openLocationSettings();
        }
        if (locationPermission == LocationPermission.always ||
            locationPermission == LocationPermission.whileInUse) {
          final current = await Geolocator.getCurrentPosition();
          userLocation = LatLng(current.latitude, current.longitude);
        }
      } else if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        final current = await Geolocator.getCurrentPosition();
        userLocation = LatLng(current.latitude, current.longitude);
      }
    } else {
      await Geolocator.openLocationSettings();
    }
    debugPrint(
        "User Location\nLat: ${userLocation!.latitude}\nLng: ${userLocation!.longitude}");
    notifyListeners();
  }
}
