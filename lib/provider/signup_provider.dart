import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/register_model.dart';

class SignUpProvider extends ChangeNotifier {

  RegisterModel? registerModel;

  bool loggedIn = false;

  void userRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String gender,
    required String profession,
  }) {
    DioHelper.post(
      endPoint: registerEndPoint,
      data:
      {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'birth_date': birthDate,
        'phone_number': phoneNumber,
        'gender': gender,
        'profession': profession,
      },
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      loggedIn = true;
      notifyListeners();
    }).catchError((error) {
      print(error.toString());
      loggedIn = false;
      notifyListeners();
    });
  }
}
