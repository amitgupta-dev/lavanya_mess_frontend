import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/screens/main_screens/home.dart';
import 'package:lavanya_mess/widgets/auth_layout.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
        const CustomInputWidget(text: "Email"),
        const CustomInputWidget(text: "Password"),
        CustomButton(
          text: "Login",
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
          },
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
