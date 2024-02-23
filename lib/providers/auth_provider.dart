import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/main_screens/dashboard.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _userData;

  dynamic get authData => _userData;

  Future<int?> fetchMyData(String token) async {
    final response = await ApiService.request('/user', token: token);
    if (response['statusCode'] == 200) {
      _userData = response['data']['user'];
      debugPrint(response['data']['user'].toString());
      notifyListeners();
      return response['statusCode'];
    } else {
      notifyListeners();
      return response['statusCode'];
    }
  }

  void login(BuildContext context, dynamic body) async {
    debugPrint('nice');
    final response =
        await ApiService.request('/auth/login', method: 'POST', body: body);

    debugPrint(response['data']['user'].toString());
    if (response['statusCode'] == 201) {
      _userData = response['data']['user'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['data']['user']['token']);

      notifyListeners();
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${response['data']['message']}"),
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
      notifyListeners();
    }
  }
}
