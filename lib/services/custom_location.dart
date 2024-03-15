import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class CustomLocation {
  static String mapsSessionToken = const Uuid().v4();
  static Future<LatLng> currentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var location = await Geolocator.getCurrentPosition();

    return LatLng(location.latitude, location.longitude);
  }

  static dynamic getSuggestions(String input) async {
    String mapsKey = 'AIzaSyC_UCKe3KH8_OENIB05h3sP_D0_1lR-M8E';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$mapsKey&sessiontoken=$mapsSessionToken';
    debugPrint(request);
    final Map<String, String> body = {
      "url": request,
    };
    final response =
        await ApiService.request('/proxyRequest', method: 'POST', body: body);
    debugPrint(response['data']['predictions'].toString());
    return response;
  }

  static dynamic getLocationFromPlaceId(
      {LatLng? coordinates, String? placeId}) async {
    String mapsKey = 'AIzaSyC_UCKe3KH8_OENIB05h3sP_D0_1lR-M8E';
    String baseURL = 'https://maps.googleapis.com/maps/api/geocode/json';
    http.Response response;

    if (coordinates != null) {
      response = await http.get(
        Uri.parse(
            '$baseURL?latlng=${coordinates.latitude},${coordinates.longitude}&key=$mapsKey'),
      );
    } else if (placeId != null) {
      response =
          await http.get(Uri.parse('$baseURL?place_id=$placeId&key=$mapsKey'));
    } else {
      throw Exception('no paramaters passed');
    }

    return {
      "statusCode": response.statusCode,
      "location": response.statusCode == 200
          ? {
              "formatted_address": json.decode(response.body)['results'][0]
                  ['formatted_address'],
              "coords": {
                "latitude": json.decode(response.body)['results'][0]['geometry']
                    ['location']['lat'],
                "longitude": json.decode(response.body)['results'][0]
                    ['geometry']['location']['lng']
              }
            }
          : {}
    };
  }
}
