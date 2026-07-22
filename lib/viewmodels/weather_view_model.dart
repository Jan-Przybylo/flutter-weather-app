import 'package:flutter/material.dart';
import 'package:weather/repository/current_weather_repository.dart';

import '../models/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  Weather? _weather;

  Weather? get weather => _weather;

  bool loading = false;
  bool hasData = false;

  String? error;

  final String city;
  WeatherViewModel({required this.city})
  {
    _currentWeatherRepository = CurrentWeatherRepository(city: city);
  }

  late CurrentWeatherRepository _currentWeatherRepository;

  void loadWeather() async {
    try {
      loading = true;
      hasData = false;
      notifyListeners();

      _weather = await _currentWeatherRepository.fetchData();
    } catch (e) {
      error = "Nie udało się wczytać pogody $e";
      throw Exception(error);
    } finally {
      hasData = true;
      loading = false;
      notifyListeners();
    }
  }
}
