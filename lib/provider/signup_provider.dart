import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/register_model.dart';

class SignUpProvider extends ChangeNotifier {

  RegisterSuccessModel? registerSuccessModel;

  RegisterErrorModel? registerErrorModel;

  Future<Either<RegisterErrorModel, RegisterSuccessModel>> userRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String gender,
    required String profession,
  }) async {
    final response = await DioHelper.post(
      endPoint: registerEndPoint,
      data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'birth_date': birthDate,
        'phone_number': phoneNumber,
        'gender': gender,
        'profession': profession,
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
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String gender,
    required String profession,
  }) async {
    (await userRegister(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        phoneNumber: phoneNumber,
        gender: gender,
        profession: profession)).fold(
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
