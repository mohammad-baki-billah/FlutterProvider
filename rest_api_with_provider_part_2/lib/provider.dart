import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_api_with_provider_part_2/api_services.dart';
import 'package:rest_api_with_provider_part_2/user_model.dart';

class userProvider with ChangeNotifier {
  // With Model
  UserModel userModel = UserModel();
  bool isLoading = true;

  getUserData() async {
    await ApiServices().getUserApi().then((value) {
      userModel = value!;
    }).onError((error, stackTrace) {
      print('Api Provider Error: $error');
    });

    isLoading = false;
    notifyListeners();
  }

  //Without Model
  dynamic userData;
  getUserDataWithoutModel() async {
    await ApiServices().getUderApiWithoutModel().then((value) {
      userData = value;
    }).onError((error, stackTrace) {
      print('Api Provider Error: $error');
    });
    isLoading = false;
    notifyListeners();
  }
}
