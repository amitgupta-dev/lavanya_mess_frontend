import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/address.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/utils/toast.dart';
import 'package:lavanya_mess/widgets/components/custom_button.dart';
import 'package:lavanya_mess/widgets/components/custom_input.dart';
import 'package:provider/provider.dart';

class SetLocationBottomSheet extends StatefulWidget {
  final AddressModel address;
  const SetLocationBottomSheet({super.key, required this.address});

  @override
  State<SetLocationBottomSheet> createState() => _SetLocationBottomSheetState();
}

class _SetLocationBottomSheetState extends State<SetLocationBottomSheet> {
  late AddressModel fullAddress;

  @override
  void initState() {
    fullAddress = widget.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    final List<dynamic>? savedAddresses = auth.authData?['locatins'];
    debugPrint(savedAddresses.toString());

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 6),
              child: Text(
                'Add complete address',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Wrap(children: [
                CustomInputWidget(
                  labelText: "Receiver's name",
                  value: fullAddress.receiver.name,
                  onChanged: (value) {
                    setState(() {
                      fullAddress.receiver.name = value;
                    });
                  },
                ),
                CustomInputWidget(
                  labelText: "Phone",
                  inputType: TextInputType.phone,
                  value: fullAddress.receiver.phone.toString(),
                  onChanged: (value) {
                    setState(() {
                      fullAddress.receiver.name = value;
                    });
                  },
                ),
                const Divider(),
                CustomInputWidget(
                  labelText: "Address",
                  value: fullAddress.address,
                  onChanged: (value) {
                    setState(() {
                      fullAddress.address = value;
                    });
                  },
                ),
                CustomInputWidget(
                  labelText: "Nearby Landmark",
                  value: fullAddress.landmark,
                  onChanged: (value) {
                    setState(() {
                      fullAddress.landmark = value;
                    });
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: fullAddress.isDefault,
                      activeColor: Colors.green,
                      onChanged: (bool? newValue) {
                        if (newValue != null) {
                          setState(() {
                            fullAddress.isDefault = newValue;
                          });
                        }
                      },
                    ),
                    const Text('Set as default location')
                  ],
                ),
                CustomButton(
                  text: 'Save',
                  onPressed: () {
                    ApiService.request('/user', method: 'PATCH', body: {
                      'locations': [
                        fullAddress.toJson(),
                        ...auth.authData['locations']
                      ]
                    }).then((response) {
                      auth.fetchMyData();
                      toast(context, 'Success', "Location has been added",
                          const Color.fromARGB(255, 3, 189, 74),
                          icon: Icons.check_rounded);
                      Navigator.pushNamed(context, '/dashboard');
                    }).catchError((error) {
                      toast(context, 'Failed', 'Something went wrong',
                          const Color(0xffff4747),
                          icon: Icons.check_rounded);
                    });
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
