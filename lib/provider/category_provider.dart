import 'package:flutter/material.dart';
import 'package:mono/core/Util/netWork/remote/dio.dart';
import 'package:mono/core/Util/netWork/remote/endpoint.dart';
import 'package:mono/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryModel? categoryModel;

  Future<void> getCategories() async {
    final response = await DioHelper.get(endPoint: categoriesEndPoint);
    print(response);
    try {
      if (response['data'] != []) {
        categoryModel = CategoryModel.fromJson(response);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
      notifyListeners();
    }
  }
}