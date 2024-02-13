import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/auth_screens/change_password.dart';
import 'package:lavanya_mess/screens/auth_screens/forgot_password.dart';
import 'package:lavanya_mess/screens/auth_screens/login.dart';
import 'package:lavanya_mess/screens/auth_screens/signup.dart';
import 'package:lavanya_mess/screens/auth_screens/splash_screen.dart';
import 'package:lavanya_mess/screens/auth_screens/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lavanya Mess',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const Onboarding(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/forgotPassword': (context) => const ForgotPassword(),
        '/changePassword': (context) => const ChangePassword(),
      },
    );
  }
}
