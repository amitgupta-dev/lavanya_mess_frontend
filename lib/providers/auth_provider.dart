import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/auth_screens/splash_screen.dart';
import 'package:lavanya_mess/screens/main_screens/dashboard.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _userData;

  dynamic get authData => _userData;

  Future<int?> fetchMyData({String? token}) async {
    final response = await ApiService.request('/user');
    if (response['statusCode'] == 200) {
      _userData = response['data']['user'];
      notifyListeners();
      return response['statusCode'];
    } else {
      notifyListeners();
      return response['statusCode'];
    }
  }

  void signupLogin(BuildContext context, dynamic body, String path) async {
    final response =
        await ApiService.request('/auth/$path', method: 'POST', body: body);
    if (response['statusCode'] == 201) {
      _userData = response['data']['user'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['data']['user']['token']);

      if (!context.mounted) return;
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    } else {
      if (context.mounted) {
        toast(context, 'Error', "${response['data']['message']}",
            const Color(0xffff4747));
      }
    }
    notifyListeners();
  }

  void logout(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    });
  }
}
