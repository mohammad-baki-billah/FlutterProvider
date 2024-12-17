import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_post_api_with_provider_part_5/login_moled.dart';

class ApiServices {
  final String _baseUrl = 'https://reqres.in/api/login';

  Future<LoginModel?> getLoginData(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: {"email": email, "password": password},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = LoginModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        print('Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
    return null;
  }
}
