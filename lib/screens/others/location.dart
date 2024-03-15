import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lavanya_mess/models/address.dart';
import 'package:lavanya_mess/services/custom_location.dart';
import 'package:lavanya_mess/widgets/set_location_bottom_sheet.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Timer? _debounceTimer;
  dynamic placesList = [];
  GoogleMapController? mapController;
  late LatLng _center = const LatLng(23.34777, 85.33856);
  final TextEditingController _controller = TextEditingController();

  AddressModel fullAddress = AddressModel(
    isDefault: false,
    receiver: ReceiverModel(
      name: '',
      phone: 0,
    ),
    address: '',
    landmark: '',
    location: LocationModel(
      type: 'Point',
      coordinates: [],
    ),
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _controller.addListener(() {
      startDebounceTimer(context);
    });

    CustomLocation.getLocationFromPlaceId(coordinates: _center)
        .then((response) => {
              if (response['statusCode'] == 200)
                setState(() {
                  fullAddress.address =
                      response['location']['formatted_address'];
                  fullAddress.location.coordinates = [
                    _center.latitude,
                    _center.longitude
                  ];
                })
            });
    super.initState();
  }

  void startDebounceTimer(BuildContext context) {
    // Cancel the existing debounce timer if it's active
    _debounceTimer?.cancel();
    // Start a new debounce timer
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      onChange(context);
    });
  }

  void onChange(BuildContext context) async {
    dynamic response = await CustomLocation.getSuggestions(_controller.text);
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
                        idleTimer = Timer(const Duration(seconds: 2), () async {
                          // No interaction for 2 seconds, get location
                          setState(() {
                            _center = LatLng(cameraPosition.target.latitude,
                                cameraPosition.target.longitude);
                            fullAddress.location.coordinates = [
                              cameraPosition.target.latitude,
                              cameraPosition.target.longitude
                            ];
                          });
                          dynamic response =
                              await CustomLocation.getLocationFromPlaceId(
                                  coordinates: _center);
                          if (response['statusCode'] == 200) {
                            setState(() {
                              fullAddress.address =
                                  response['location']['formatted_address'];
                              placesList = [];
                              _controller.text = '';
                            });
                          }
                          debugPrint('camera moved: $_center');
                        });
                      },
                    ),
                    const Positioned(
                      // Center the image horizontally and vertically
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      bottom: 53.0,
                      child: Center(
                        child: Image(
                          image: AssetImage(
                            'assets/icons/marker.png',
                          ),
                          width: 60,
                        ),
                      ),
                    ),
                    placesList.length != 0
                        ? Positioned(
                            top: 60,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: ListView.builder(
                              itemCount: placesList
                                  .length, // Number of items in the list
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextButton(
                                      onPressed: () async {
                                        LatLng newlatlang;
                                        dynamic response = await CustomLocation
                                            .getLocationFromPlaceId(
                                                placeId: placesList[index]
                                                    ['place_id']);
                                        if (response['statusCode'] == 200) {
                                          newlatlang = LatLng(
                                              response['location']['coords']
                                                  ['latitude'],
                                              response['location']['coords']
                                                  ['longitude']);
                                          setState(() {
                                            _center = newlatlang;
                                            fullAddress.address =
                                                response['location']
                                                    ['formatted_address'];
                                            placesList = [];
                                          });
                                        }

                                        mapController?.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: _center, zoom: 16.0),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        backgroundColor: Colors.white,
                                        alignment: Alignment.centerLeft,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: index == 0
                                                ? const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))
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
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      )),
                                );
                              },
                            ),
                          )
                        : Container(),
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
                              hintText: 'Search any Place',
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
                          LatLng newlatlang =
                              await CustomLocation.currentLocation();
                          setState(() {
                            _center = newlatlang;
                          });
                          dynamic response =
                              await CustomLocation.getLocationFromPlaceId(
                                  coordinates: _center);
                          if (response['statusCode'] == 200) {
                            setState(() {
                              fullAddress.address =
                                  response['location']['formatted_address'];
                            });
                          }

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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xffff4747),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              fullAddress.address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 20),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0)),
                            ),
                            useSafeArea: true,
                            builder: (context) =>
                                SetLocationBottomSheet(address: fullAddress),
                          );
                        },
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
