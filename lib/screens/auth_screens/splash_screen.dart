import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/screens/auth_screens/login.dart';
import 'package:lavanya_mess/screens/auth_screens/onboarding.dart';
import 'package:lavanya_mess/screens/main_screens/dashboard.dart';
import 'package:lavanya_mess/utils/toast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthProvider? _auth;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _auth = Provider.of<AuthProvider>(context, listen: false);
    });
    Timer(const Duration(seconds: 2), () {
      manageNavigation(context);
    });
    super.initState();
  }

  void manageNavigation(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      bool doneBoarding = prefs.getBool('doneBoarding') ?? false;
      String? token = prefs.getString('token');

      if (!doneBoarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
        );
      } else {
        if (token != null) {
          _auth?.fetchMyData().then((statusCode) {
            if (statusCode == 200) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            }
          }).catchError((error) {
            debugPrint("Error fetching user data: $error");
            if (error is SocketException) {
              toast(
                  context,
                  'Error',
                  'No Internet Connection. Please try again later.',
                  const Color(0xffff4747));
            } else if (error is TimeoutException) {
              toast(context, 'Error', 'An error occurred',
                  const Color(0xffff4747));
            } else {
              toast(context, 'Error', 'An error occurred',
                  const Color(0xffff4747));
            }
          });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        }
      }
    }).catchError((error) {
      debugPrint("Error getting SharedPreferences: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching user data: $error'),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
        ],
      ),
    );
  }
}
