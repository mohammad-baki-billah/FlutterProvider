import 'package:flutter/material.dart';
import 'package:rest_post_api_with_provider_part_5/api_services.dart';
import 'package:rest_post_api_with_provider_part_5/login_moled.dart';

class ApiProvider with ChangeNotifier {
  final ApiServices apiServices;

  ApiProvider({required this.apiServices});

  bool isLoading = false;
  LoginModel? loginModel;
  String? errorMessage;

  Future<void> getDataResponse(String email, String password) async {
    isLoading = true;
    errorMessage = null; // Reset any previous error message
    notifyListeners();

    try {
      final response = await apiServices.getLoginData(email, password);
      if (response != null) {
        loginModel = response;
      } else {
        errorMessage = "Invalid login credentials or server error.";
      }
    } catch (error) {
      errorMessage = "An error occurred: ${error.toString()}";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
