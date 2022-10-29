import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/service_model.dart';

class ServiceProvider extends ChangeNotifier {

  List<ServiceModel?> serviceModels= [];

  Future<void> getServices() async {
    final response = await DioHelper.get(endPoint: servicesEndPoint);
    print(response);
    try {
      if (response['data'] != []) {
        int firstPage = response['meta'] ['current_page'];
        int lastPage = response['meta'] ['last_page'];

        for (var i = firstPage; i <= lastPage; i++){
          if(i != 2) {
            final pageResponse = await DioHelper.get(endPoint: servicesEndPoint, query: {'page': i});

            serviceModels.add(ServiceModel.fromJson(pageResponse));
          }
        }
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }

  int minListLength(int length){
    if(length > 3) {
      return 3;
    } else if(length >= 1) {
      return 1;
    } else {
      return 0;
    }
  }
}