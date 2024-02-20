import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  dynamic _authData;
  dynamic _loginData;
  dynamic _error;

  dynamic get authData => _authData;
  dynamic get loginData => _loginData;
  dynamic get error => _error;

  Future<void> savePrefsValue(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getPrefsValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  void fetchData() async {
    final token = await getPrefsValue('token');
    final response = await http.get(
      Uri.parse('http://192.168.65.231:5000/api/user'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode < 300) {
      _authData = json.decode(response.body);
      debugPrint(json.encode(authData));
      notifyListeners();
    } else {
      _error = json.decode(response.body);
      notifyListeners();
    }
  }

  void login(dynamic body) async {
    debugPrint(json.encode(body));
    final response =
        await http.post(Uri.parse('http://192.168.65.231:5000/api/auth/login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'token', json.decode(response.body)['user']['token']);
      _loginData = json.decode(response.body);
      debugPrint(json.encode(loginData));
      notifyListeners();
    } else {
      _error = json.decode(response.body);
      notifyListeners();
    }
  }

  void signup(dynamic body) async {
    debugPrint(json.encode(body));
    final response =
        await http.post(Uri.parse('http://192.168.65.231:5000/api/auth/signup'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(body));
    if (response.statusCode == 200) {
      _authData = json.decode(response.body);
      debugPrint(json.encode(authData));
      notifyListeners();
    } else {
      _error = json.decode(response.body);
      notifyListeners();
    }
  }
}
