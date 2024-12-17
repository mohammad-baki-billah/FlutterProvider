import 'dart:convert';
import 'package:rest_api_with_provider_part_4/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<UserModel>?> getUserData() async {
    try {
      String url = 'https://jsonplaceholder.typicode.com/comments';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<UserModel> usermodel = List<UserModel>.from(json.decode(response.body).map((x)=>UserModel.fromJson(x)));
        return usermodel;
      }
    } catch (e) {
      print("API Error: $e");
    }
    return null;
  }
}
