import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mono/models/city_model.dart';

class CityProvider with ChangeNotifier {
CityProvider() {
    loadCountries().then((cities) {
      _cities = cities;
      notifyListeners();
    });
  }

  List<City> _cities = [];

  List<City> get cities => _cities;

  Future loadCountries() async {
    final data = await rootBundle.loadString('assets/cities/cities.json');
    final citiesJson = json.decode(data);

    return citiesJson.keys.map<City>((code) {
      final json = citiesJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});

      return City.fromJson(newJson);
    }).toList();
  }
}