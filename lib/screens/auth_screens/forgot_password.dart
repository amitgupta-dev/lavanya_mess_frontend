import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/auth_layout.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool otpSent = false;
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      heading: const Text(
        "Forgot Password",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        const CustomInputWidget(labelText: "Email"),
        CustomButton(
          text: "Send OTP",
          onPressed: () {
            setState(() {
              otpSent = true;
            });
          },
        ),
        if (otpSent) ...[
          const CustomInputWidget(labelText: "OTP"),
          CustomButton(
            text: "Vertify",
            onPressed: () {
              Navigator.pushNamed(context, '/changePassword');
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text("Resend OTP 60"),
          )
        ]
      ],
    );
  }
}
