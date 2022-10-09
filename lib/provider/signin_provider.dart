import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/login_model.dart';

class SignInProvider extends ChangeNotifier {
  LoginSuccessModel? loginSuccessModel;

  LoginErrorModel? loginErrorModel;

  Future<Either<LoginErrorModel, LoginSuccessModel>> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.post(
      endPoint: loginEndPoint,
      data: {
        'email': email,
        'password': password,
      },
    );
    try {
      if (response['message'] != 'Auth failed') {
        loginSuccessModel = LoginSuccessModel.fromJson(response);
        return Right(LoginSuccessModel.fromJson(response));
      } else {
        loginErrorModel = LoginErrorModel.fromJson(response);
        return Left(LoginErrorModel.fromJson(response));
      }
    } catch (error) {
      loginErrorModel = LoginErrorModel.fromJson(response);
      return Left(LoginErrorModel.fromJson(response));
    }
  }

  login({
    required String email,
    required String password,
  }) async {
    (await userLogin(email: email, password: password)).fold(
        (left) => {
              print(loginErrorModel!.message),
              notifyListeners()
            },
        (right) => {
              print(loginSuccessModel!.message!.token),
              notifyListeners()
            });
  }
}
