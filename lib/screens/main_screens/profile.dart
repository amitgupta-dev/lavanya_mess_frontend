import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
<<<<<<< HEAD
    super.initState();
    updates['avatar'] = widget.data["avatar"];
    updates['name'] = widget.data["name"];
    updates['email'] = widget.data["email"];
    updates['phone'] = widget.data["phone"];
    if (widget.data.containsKey("dob") && widget.data["dob"] != null) {
      updates['dob'] = DateTime.parse(widget.data["dob"]);
    }
    updates['gender'] = widget.data["gender"];
=======
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

      setState(() {
        updates['name'] = auth.authData["name"];
        updates['email'] = auth.authData["email"];
        updates['phone'] = auth.authData["phone"];
        updates['dob'] = auth.authData["dob"];
        updates['gender'] = auth.authData["gender"];
      });
      debugPrint(updates.toString());
    });

    super.initState();
>>>>>>> parent of 7425639 (multiple updates)
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    AuthProvider auth = Provider.of<AuthProvider>(context);
    TextEditingController dateInputController = TextEditingController();
=======
    TextEditingController datePickerController = TextEditingController();
    debugPrint(updates.toString());
>>>>>>> parent of 7425639 (multiple updates)
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Email',
                            value: updates['email'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Phone',
                            value: updates['phone'].toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                lastDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                initialDate: DateTime.now(),
                              );
                              if (pickedDate == null) return;
                              datePickerController.text =
                                  DateFormat('dd/mm/yyyy').format(pickedDate);
                              setState(() {
                                updates['dob'] =
                                    (pickedDate.millisecondsSinceEpoch / 1000)
                                        .round();
                              });
                            },
                            child: AbsorbPointer(
                              child: CustomInputWidget(
                                labelText: 'DOB',
                                readOnly: true,
                                inputType: TextInputType.datetime,
                                value: updates['dob'] != null
                                    ? DateFormat('dd/MM/yyyy').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            updates['dob'] * 1000))
                                    : "",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomInputWidget(
                            labelText: 'Gender',
                            value: updates['gender'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomButton(
                              text: 'Update',
                              onPressed: () {
                                debugPrint(updates.toString());
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
