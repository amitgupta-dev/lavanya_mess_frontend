import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'https://lavanya-mess.vercel.app/api';

  static Future<Map<String, dynamic>> request(String endpoint,
      {String method = 'GET', dynamic body, String? token}) async {
    final url = '$_baseUrl$endpoint';
    late http.Response response;

    if (token == null) {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
    }
    switch (method) {
      case 'GET':
        response = await http.get(Uri.parse(url), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        break;
      case 'POST':
        response =
            await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        break;
      case 'PUT':
        response =
            await http.put(Uri.parse(url), body: jsonEncode(body), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        break;
      case 'PATCH':
        response =
            await http.patch(Uri.parse(url), body: jsonEncode(body), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        break;
      case 'DELETE':
        response = await http.delete(Uri.parse(url), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        break;
      default:
        throw Exception('Invalid HTTP method');
    }

    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    return {
      "data": json.decode(response.body),
      "statusCode": response.statusCode,
    };
  }
}
