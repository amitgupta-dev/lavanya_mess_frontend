import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/utils/toast.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Child(data: auth.authData);
  }
}

class Child extends StatefulWidget {
  final Map<String, dynamic> data;
  const Child({super.key, required this.data});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  Map<String, dynamic> updates = {
    "avatar": "",
    "name": "",
    "email": "",
    "phone": null,
    "dob": DateTime.now(),
    "gender": "",
  };

  @override
  void initState() {
    super.initState();
    updates['avatar'] = widget.data["avatar"];
    updates['name'] = widget.data["name"];
    updates['email'] = widget.data["email"];
    updates['phone'] = widget.data["phone"];
    if (widget.data.containsKey("dob") && widget.data["dob"] != null) {
      updates['dob'] = DateTime.parse(widget.data["dob"]);
    }
    updates['gender'] = widget.data["gender"];
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    TextEditingController dateInputController = TextEditingController();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 253, 239, 239),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 160,
                    height: 160,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: const Color.fromARGB(255, 255, 246, 246)),
                      image: DecorationImage(
                        image: NetworkImage(updates['avatar']),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Name',
                            value: updates['name'],
                            onChanged: (value) {
                              setState(() {
                                updates['name'] = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Email',
                            value: updates['email'],
                            onChanged: (value) {
                              setState(() {
                                updates['email'] = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Phone',
                            value: updates['phone'].toString(),
                            onChanged: (value) {
                              setState(() {
                                updates['phone'] = int.parse(value);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 12),
                          child: InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                lastDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                initialDate: updates['dob'],
                              );
                              if (pickedDate == null) return;
                              dateInputController.text =
                                  DateFormat('dd/MM/yyyy')
                                      .format(updates['dob'])
                                      .toString();
                              setState(() {
                                updates['dob'] =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        (pickedDate.millisecondsSinceEpoch /
                                                    1000)
                                                .round() *
                                            1000);
                              });
                            },
                            child: AbsorbPointer(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(updates['dob'])
                                        .toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: DropdownButtonFormField<String>(
                            value: updates['gender'],
                            items: const [
                              DropdownMenuItem(
                                value: "Male",
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Female",
                                child: Text(
                                  "Female",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Others",
                                child: Text(
                                  "Others",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                updates['gender'] = newValue;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: "Gender",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomButton(
                              text: 'Update',
                              onPressed: () {
                                ApiService.request('/user',
                                    method: 'PATCH',
                                    body: {
                                      ...updates,
                                      'dob': updates['dob'].toIso8601String()
                                    }).then((response) {
                                  debugPrint(response.toString());
                                  response['statusCode'] == 200
                                      ? toast(
                                          context,
                                          'Success',
                                          response['data']['message'],
                                          const Color.fromARGB(255, 3, 189, 74),
                                          icon: Icons.check_rounded)
                                      : toast(
                                          context,
                                          'Error',
                                          response['data']['message'],
                                          const Color(0xffff4747),
                                          icon: Icons.error_outline_outlined);
                                  auth.fetchMyData();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
