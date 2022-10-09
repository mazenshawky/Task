import 'package:flutter/material.dart';
import 'package:mono/models/city_model.dart';
import 'package:mono/provider/city_provider.dart';
import 'package:mono/widgets/city_list_tile_widget.dart';
import 'package:mono/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class CityScreen extends StatefulWidget {
  final List<City> cities;

  const CityScreen({
    Key? key,
    this.cities = const [],
  }) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String text = '';
  List<City> selectedCities = [];

  @override
  void initState() {
    super.initState();

    selectedCities = widget.cities;
  }

  bool containsSearchText(City city) {
    final name = city.name;
    final textLower = text.toLowerCase();
    final countryLower = name.toLowerCase();

    return countryLower.contains(textLower);
  }

  List<City> getPrioritizedCities(List<City> cities) {
    final notSelectedCities = List.of(cities)
      ..removeWhere((city) => selectedCities.contains(city));

    return [
      ...List.of(selectedCities),
      ...notSelectedCities,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
    final allCities = getPrioritizedCities(provider.cities);
    final cities = allCities.where(containsSearchText).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchWidget(
            text: text,
            onChanged: (text) => setState(() => this.text = text),
            hintText: 'Search City',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: cities.map((city) {
                return CityListTileWidget(
                  city: city,
                  onSelectedCity: selectCity,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void selectCity(City city) {
      Navigator.pop(context, city);
  }
}