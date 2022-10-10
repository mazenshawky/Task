import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/service_model.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceModel? serviceModel;

  Future<void> getServices() async {
    final response = await DioHelper.get(endPoint: servicesEndPoint);
    print(response);
    try {
      if (response['data'] != []) {
        serviceModel = ServiceModel.fromJson(response);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }
}