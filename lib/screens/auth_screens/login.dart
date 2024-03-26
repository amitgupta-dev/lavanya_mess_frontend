import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/widgets/layout/auth_layout.dart';
import 'package:lavanya_mess/widgets/components/custom_input.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
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
          labelText: "Email",
          onChanged: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        CustomInputWidget(
          labelText: "Password",
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
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
                          'Logging in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  : const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
              onPressed: () async {
                if (_email.isNotEmpty && _password.isNotEmpty) {
                  final Map<String, String> body = {
                    "email": _email,
                    "password": _password
                  };
                  await auth.signupLogin(context, body, 'login');
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/forgotPassword');
            },
            child: const Text(
              "Forgot Password ?",
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
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: screenWidth > 350 ? Axis.horizontal : Axis.vertical,
            children: [
              const Text(
                "Don't have an account ?",
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Sign up Now!"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
