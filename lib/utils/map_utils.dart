import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart' as loc;
import 'package:location/location.dart';

class MapUtils {
  static Future<Stream<loc.LocationData>?> getUserLocationStream() async {
    try {
      debugPrint("Initializing Variables!");
      Stream<loc.LocationData>? positionStream;
      bool serviceEnabled;
      loc.PermissionStatus permission;
      loc.Location location = loc.Location();

      // Test if location services are enabled.
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          debugPrint('Location services are disabled.');
          return positionStream;
        }
      }
      debugPrint("Location Service is Enabled");
      permission = await location.hasPermission();
      if (permission == loc.PermissionStatus.denied) {
        permission = await location.requestPermission();
        if (permission == loc.PermissionStatus.denied) {
          debugPrint("Permissions are denied");
          return positionStream;
        }
      }
      debugPrint("Permissions are granted");
      if (permission == loc.PermissionStatus.deniedForever) {
        debugPrint(
            'Location permissions are permanently denied, we cannot request permissions.');
        return positionStream;
      }

      positionStream = location.onLocationChanged;
      return positionStream;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static rad(x) {
    return x * math.pi / 180;
  }

  static double getDistance(LatLng p1, LatLng p2) {
    var R = 6378137; // Earth’s mean radius in meter
    var dLat = rad(p2.latitude - p1.latitude);
    var dLong = rad(p2.longitude - p1.longitude);
    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(rad(p1.latitude)) *
            math.cos(rad(p2.latitude)) *
            math.sin(dLong / 2) *
            math.sin(dLong / 2);
    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    var d = R * c;
    return d; // returns the distance in meter
  }

  static double getZoomLevel(double radius) {
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - math.log(scale) / math.log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }

  static Future<int> getStepCount(
      LatLng userLocation, LocationData data) async {
    int meters = getDistance(
      userLocation,
      LatLng(
        data.latitude!,
        data.longitude!,
      ),
    ).toInt();
    int stepCount = (meters / 0.64008).ceilToDouble().toInt();
    return stepCount;
  }
}
