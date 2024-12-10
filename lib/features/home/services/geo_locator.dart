import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/reverse_geocoding.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

class GeoLocator {
  static Future<Position> gpsPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
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
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // static Future<List<Placemark>> reverse_geocoding(double lat, double lon) async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //     lat,
  //     lon,
  //   );
  //   return placemarks;
  // }

  static Future<ReverseGeocoding> reverseGeocoding(
      double lat, double lon) async {
    var client = http.Client();
    try {
      Uri url = Uri.parse(
          "http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&appid=$apiKey");
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return ReverseGeocoding.fromJson(result[0]);
      } else {
        throw ();
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      client.close();
    }
  }
}
