import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://192.168.65.231:5000/api';

  static Future<Map<String, dynamic>> request(String endpoint,
      {String method = 'GET',
      Map<String, dynamic>? body,
      String? token}) async {
    final url = '$_baseUrl$endpoint';
    late http.Response response;

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
        response = await http.put(Uri.parse(url), body: body, headers: {
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
