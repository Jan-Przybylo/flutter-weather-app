import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/repository/city_repository.dart';

class CityViewModel extends ChangeNotifier {
  Set<City> cities = {};
  final CityRepository cityRepository = CityRepository();

  bool loading = false;
  bool hasData = false;

  String? error;

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cityJson = prefs.getString('city');

    if (cityJson == null || cityJson.isEmpty) return;

    final cityMap = jsonDecode(cityJson) as Map<String, dynamic>;
    final savedCity = City.fromJson(cityMap);
    savedCity.saved = true;
    cities.add(savedCity);
  }

  Future<void> loadCities({required String query}) async {
    try {
      loading = true;
      hasData = false;
      notifyListeners();

      cities = await cityRepository.fetchData(city: query);
      await loadSavedData();

      hasData = true;
    } catch (e) {
      hasData = false;
      error = "WM: Nie udało się uzyskać informacji o mieście! \n $e";
      throw Exception(error);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  CityViewModel(){ _init();}
    
    Future<void> _init() async
    {
      await loadSavedData();
      hasData = true;
      notifyListeners();
    }
  
}
