import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/add_service_model.dart';
import 'package:mono/utilites/constants.dart';

class AddServiceProvider extends ChangeNotifier {
  AddServiceModel? addServiceModel;

  Future<void> addService({
    required String name,
    required int categoryId,
    required int subCategoryId,
    required String price,
    required int cityId,
  }) async {
    final response = await DioHelper.post(
      endPoint: addServiceEndPoint,
      data: {
        'name': name,
        'category_id': categoryId,
        'subcategory_id': subCategoryId,
        'price': price,
        'city_id': cityId,
      },
      token: token,
    );
    try {
      if (response['message'] != '') {
        addServiceModel = AddServiceModel.fromJson(response);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }
}
