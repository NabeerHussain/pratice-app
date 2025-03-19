import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class ApiService {
  // static const String baseUrl = "http:// 10.112.24.153:8081/api"; // Change for emulator if needed
  static const String baseUrl = "http://192.168.18.21:8081/api"; // Change for emulator if needed

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {'Content-Type': 'application/json'}, // Send JSON format
        body: jsonEncode({'login': email, 'password': password}), // Ensure correct API format
      );

      log("API Response: ${response.body}");

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'error': json.decode(response.body)['message'] ?? 'Invalid credentials'};
      }
    } catch (e) {
      return {'error': "Network Error: ${e.toString()}"};
    }
  }
}
