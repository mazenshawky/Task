import 'package:flutter/material.dart';
import 'package:mono/models/city_model.dart';

class CityListTileWidget extends StatelessWidget {
  final City city;
  final ValueChanged<City> onSelectedCity;

  const CityListTileWidget({
    Key? key,
    required this.city,
    required this.onSelectedCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 18);

    return ListTile(
      onTap: () => onSelectedCity(city),
      title: Text(
        city.name,
        style: style,
      ),
    );
  }
}