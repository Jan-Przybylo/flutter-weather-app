import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/features/city_search/data/models/city_model.dart';

class LocalCityData {
  void saveCity({required CityModel city}) async {
    debugPrint("saved ${jsonEncode(city.toJson())}");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('city', jsonEncode(city.toJson()));
  }

  Future<CityModel?> loadCity() async {
    final prefs = await SharedPreferences.getInstance();
    return CityModel.fromMap(jsonDecode(prefs.getString('city') as String));
  }
}