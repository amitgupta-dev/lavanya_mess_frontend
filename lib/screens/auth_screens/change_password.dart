import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/layout/auth_layout.dart';
import 'package:lavanya_mess/widgets/components/custom_button.dart';
import 'package:lavanya_mess/widgets/components/custom_input.dart';

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
        const CustomInputWidget(labelText: "New Password"),
        const CustomInputWidget(labelText: "Confirm New Password"),
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
