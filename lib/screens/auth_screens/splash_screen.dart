import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/auth_screens/onboarding.dart';
import 'package:lavanya_mess/screens/main_screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<bool> _isBoarding;

  @override
  void initState() {
    super.initState();
    _isBoarding = _prefs.then((prefs) {
      return prefs.getBool('boarding') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isBoarding,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator or placeholder widget
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // Use the value of _isBoarding
          final bool isBoarding = snapshot.data!;
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    isBoarding ? const Home() : const Onboarding(),
              ),
            );
          });
          // Return a placeholder widget as the build method should return a widget immediately
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 78, 78),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/icons/ic_mess_icon.png",
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        'Lavanya Mess',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xAAffffff),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Text(
                          "Powered by Google",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Color(0xAAffffff),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
