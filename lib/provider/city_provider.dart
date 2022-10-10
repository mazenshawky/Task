import 'package:flutter/foundation.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/models/city_model.dart';

import '../core/Util/netWork/remote/endpoint.dart';

class CityProvider with ChangeNotifier {

  CityModel? citiesModel;

  Future<void> getCities() async {
    final response = await DioHelper.get(endPoint: citiesEndPoint);
    print(response);
    try {
      if (response['data'] != []) {
        citiesModel = CityModel.fromJson(response);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }
}
