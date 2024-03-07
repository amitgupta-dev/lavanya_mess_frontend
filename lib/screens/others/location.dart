import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:uuid/uuid.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  GoogleMapController? mapController;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;
  var uuid = const Uuid();
  String sessionToken = '123456';
  dynamic placesList = [];

  late LatLng _center = const LatLng(23.34777, 85.33856);

  Future<LatLng> _determinePosition() async {
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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
      startDebounceTimer();
    });
    super.initState();
  }

  void startDebounceTimer() {
    // Cancel the existing debounce timer if it's active
    _debounceTimer?.cancel();
    // Start a new debounce timer
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      // Execute onChange function after debounce duration
      onChange();
    });
  }

  void onChange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggestions(_controller.text);
  }

  void getSuggestions(String input) async {
    String PLACES_API_KEY = 'AIzaSyC_UCKe3KH8_OENIB05h3sP_D0_1lR-M8E';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$PLACES_API_KEY&sessiontoken=$sessionToken';
    debugPrint(request);

    final Map<String, String> body = {
      "url": request,
    };
    final response =
        await ApiService.request('/proxyRequest', method: 'POST', body: body);
    debugPrint(response['data']['predictions'].toString());
    try {
      if (response['statusCode'] == 200) {
        setState(() {
          placesList = response['data']['predictions'];
        });
      } else {
        debugPrint('Something went wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer? idleTimer;
    void getAndSetCenter() async {
      try {
        LatLng position = await _determinePosition();
        setState(() {
          _center = position;
        });
        debugPrint(_center.toString());
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set desired color
          ),
          title: const Text(
            'Choose Delivery Location',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xffff4747),
          elevation: 2,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    // Your other app content goes here
                    GoogleMap(
                      onMapCreated: _onMapCreated,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 16.0,
                      ),
                      onCameraMove: (cameraPosition) {
                        idleTimer?.cancel();
                        idleTimer = Timer(const Duration(seconds: 2), () {
                          // No interaction for 2 seconds, get location
                          setState(() {
                            _center = LatLng(cameraPosition.target.latitude,
                                cameraPosition.target.longitude);
                          });
                          debugPrint(_center.toString());
                        });
                      },
                    ),
                    const Positioned(
                      // Center the image horizontally and vertically
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      bottom: 30.0,
                      child: Center(
                        child: Image(
                          image: AssetImage(
                            '/icons/marker.png',
                          ),
                          width: 60,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: ListView.builder(
                        itemCount:
                            placesList.length, // Number of items in the list
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  backgroundColor: Colors.white,
                                  alignment: Alignment.centerLeft,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: index == 0
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10))
                                          : index == placesList.length - 1
                                              ? const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10))
                                              : const BorderRadius.all(
                                                  Radius.zero)),
                                ),
                                child: Text(
                                  placesList[index]['description'],
                                  style: const TextStyle(color: Colors.black54),
                                )),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 220, 219, 219)),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              suffixIcon: const Icon(
                                color: Color(0xFFff4747),
                                Icons.search_outlined,
                                size: 30,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              border: InputBorder.none,
                              hintText: 'Search any Dish',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 30.0,
                      bottom: 30.0,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () async {
                          LatLng newlatlang = await _determinePosition();
                          setState(() {
                            _center = newlatlang;
                          });
                          mapController?.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 16.0),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.gps_fixed_outlined,
                          color: Color(0xffff4747),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xffff4747),
                        ),
                        Text(
                          'Ranchi',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      width: double.maxFinite,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 20),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffff4747),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Enter Complete Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
