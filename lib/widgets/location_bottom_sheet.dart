import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LocationBottomSheet extends StatefulWidget {
  const LocationBottomSheet({super.key});

  @override
  State<LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    final List<dynamic>? savedAddresses = auth.authData?['locatins'];
    debugPrint(savedAddresses.toString());

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Add Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        size: 18,
                        Icons.my_location_outlined,
                        color: Color(0xaa000000),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xaa000000),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/location'),
                    child: const Row(
                      children: [
                        Icon(
                          size: 18,
                          Icons.map_outlined,
                          color: Color(0xaa000000),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Choose on map',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xaa000000),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Saved Addresses'),
                  ),
                  Expanded(child: Divider())
                ],
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, auth, child) {
                if (auth.authData != null) {
                  return Container(
                      width: double.infinity,
                      height: auth.authData['locations'].length * 44,
                      padding: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListView.builder(
                        itemCount: auth.authData['locations'].length,
                        itemBuilder: (context, index) => ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          title: Text(
                            auth.authData['locations'][index]['address'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xaa000000)),
                          ),
                          onTap: () {
                            // Handle tap on Item 1
                          },
                        ),
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
