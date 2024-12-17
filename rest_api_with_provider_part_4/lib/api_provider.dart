import 'package:flutter/material.dart';
import 'package:rest_api_with_provider_part_4/api_services.dart';
import 'package:rest_api_with_provider_part_4/user_model.dart';

class ApiProvider with ChangeNotifier {
  bool isLoading = true;
  List<UserModel> userLIst = [];

  getUserRespnse() {
    ApiServices().getUserData().then((value) {
     
      userLIst = value!;
       isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = false;
      print(error.toString());
    });
  }
}
