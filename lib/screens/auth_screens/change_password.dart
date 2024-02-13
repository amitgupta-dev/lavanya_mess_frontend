import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/auth_layout.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/custom_input.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      heading: const Text(
        "Change Password",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        const CustomInputWidget(text: "New Password"),
        const CustomInputWidget(text: "Confirm New Password"),
        CustomButton(
          text: "Change Password",
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ],
    );
  }
}
