import 'dart:convert';
import 'package:local_storage/local_storage.dart';
import 'package:weather/features/city_search/data/models/city_model.dart';

class LocalCityData {
  void saveCity({required CityModel city}) async {
    await LocalStorage.save(key: 'city', value: jsonEncode(city.toJson()));
  }

  Future<CityModel?> loadCity() async {
    if(!await LocalStorage.has(key: 'city')) return null;
    final String? textCity = await LocalStorage.load(key: 'city');
    return CityModel.fromMap(jsonDecode(textCity!)); 
  }
}