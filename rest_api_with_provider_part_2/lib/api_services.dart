import 'dart:convert';

import 'package:rest_api_with_provider_part_2/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // with model
  Future<UserModel?> getUserApi() async {
    try {
      var url = 'https://reqres.in/api/users?page=2';

      var response = await http.get(Uri.parse(url));
      UserModel userModel = UserModel.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return userModel;
      }
    } catch (e) {
      print('Api Error: $e');
    }
    return null;
  }

  // without Model

  Future<dynamic> getUderApiWithoutModel() async {
    try {
      var url = 'https://reqres.in/api/users?page=2';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        return userData;
      }
    } catch (e) {
      print('Api Error: $e');
    }
  }
}
