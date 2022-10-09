import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/register_model.dart';

class SignUpProvider extends ChangeNotifier {

  RegisterSuccessModel? registerSuccessModel;

  RegisterErrorModel? registerErrorModel;

  Future<Either<RegisterErrorModel, RegisterSuccessModel>> userRegister({
    required String name,
    required String email,
    required String password,
    required int cityId,
  }) async {
    final response = await DioHelper.post(
      endPoint: registerEndPoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'city_id': cityId,
      },
    );
    try {
      if (response['message'] != 'please correct the data and try again') {
        registerSuccessModel = RegisterSuccessModel.fromJson(response);
        return Right(RegisterSuccessModel.fromJson(response));
      } else {

        registerErrorModel = RegisterErrorModel.fromJson(response);
        return Left(RegisterErrorModel.fromJson(response));
      }
    } catch (error) {
      registerErrorModel = RegisterErrorModel.fromJson(response);
      return Left(RegisterErrorModel.fromJson(response));
    }
  }

  register({
    required String name,
    required String email,
    required String password,
    required int cityId,
  }) async {
    (await userRegister(
        name: name,
        email: email,
        password: password,
        cityId: cityId)).fold(
            (left) => {
          print(registerErrorModel!.message),
          notifyListeners()
        },
            (right) => {
          print(registerSuccessModel!.message),
          notifyListeners()
        });
  }
}
