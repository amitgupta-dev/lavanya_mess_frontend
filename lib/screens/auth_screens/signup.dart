import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/widgets/layout/auth_layout.dart';
import 'package:lavanya_mess/widgets/components/custom_input.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Map<String, dynamic> signupData = {
    "name": "",
    "email": "",
    "password": "",
    "phone": "",
    "gender": "Male",
  };
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return AuthLayout(
      heading: Text(
        "Lavanya",
        style: GoogleFonts.leckerliOne(
          color: const Color(0xFFff4747),
          fontSize: 40,
        ),
      ),
      children: [
        CustomInputWidget(
          labelText: "Name",
          onChanged: (value) {
            setState(() {
              signupData["name"] = value;
            });
          },
        ),
        CustomInputWidget(
          labelText: "Email",
          onChanged: (value) {
            setState(() {
              signupData["email"] = value;
            });
          },
        ),
        CustomInputWidget(
          labelText: "Phone",
          onChanged: (value) {
            setState(() {
              signupData["phone"] = value;
            });
          },
        ),
        CustomInputWidget(
          labelText: "Password",
          onChanged: (value) {
            setState(() {
              signupData["password"] = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: DropdownButtonFormField<String>(
            value: signupData['gender'],
            items: const [
              DropdownMenuItem(
                value: "Male",
                child: Text(
                  "Male",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              ),
              DropdownMenuItem(
                value: "Female",
                child: Text(
                  "Female",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              ),
              DropdownMenuItem(
                value: "Others",
                child: Text(
                  "Others",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                signupData['gender'] = newValue;
              });
            },
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffff4747),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: auth.isAuthenticating
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                          height: 5,
                        ),
                        Text(
                          'Signing up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  : const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
              onPressed: () async {
                if (signupData['name'].isNotEmpty &&
                    signupData['email'].isNotEmpty &&
                    signupData['password'].isNotEmpty &&
                    signupData['phone'].isNotEmpty &&
                    signupData['gender'].isNotEmpty) {
                  await auth.signupLogin(context, signupData, 'signup');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                          'Please fill both the email and password fields'),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'Dismiss',
                        disabledTextColor: Colors.white,
                        textColor: Colors.yellow,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
                return;
              },
            ),
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OR',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  child: Image.asset(
                    'assets/icons/google.png',
                    height: 38,
                    width: 38,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  child: Image.asset(
                    'assets/icons/facebook.png',
                    height: 38,
                    width: 38,
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account ?",
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
