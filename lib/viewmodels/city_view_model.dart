import 'package:flutter/cupertino.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/repository/city_repository.dart';

class CityViewModel extends ChangeNotifier {
  Set<City> cities = {};
  final CityRepository cityRepository = CityRepository();

  bool loading = false;
  bool hasData = false;

  String? error;

  Future<void> loadCities({required String query}) async {
    try {
      loading = true;
      hasData = false;
      notifyListeners();
      cities = await cityRepository.fetchData(city: query);
    } catch (e) {
      error = "Nie udało się uzyskać informacji o mieście! \n $e";
      throw Exception(error);
    } finally
    {
      loading = false;
      hasData = true;
      notifyListeners();
    }
  }
}
