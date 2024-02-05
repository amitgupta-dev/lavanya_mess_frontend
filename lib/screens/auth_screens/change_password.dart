import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/auth_layout.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Expanded(
        flex: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromRGBO(255, 255, 255, 0.9),
            child: const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text("Change Password Page"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
