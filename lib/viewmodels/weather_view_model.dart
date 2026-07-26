import 'package:flutter/material.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/repository/current_weather_repository.dart';
import 'package:weather/repository/forecast_weather_repository.dart';

import '../models/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  Weather? _weather;
  List<Weather>? _forecastWeather;

  Weather? get weather => _weather;
  List<Weather>? get forecastWeather => _forecastWeather;

  bool loading = false;
  bool hasData = false;

  String? error;

  final City city;
  WeatherViewModel({required this.city}) {
    _currentWeatherRepository = CurrentWeatherRepository(city: city);
    _forecastWeatherRepository = ForecastWeatherRepository(city: city);
  }

  late CurrentWeatherRepository _currentWeatherRepository;
  late ForecastWeatherRepository _forecastWeatherRepository;

  Future<void> loadWeather() async {
    try {
      loading = true;
      hasData = false;
      notifyListeners();

      await loadCurrentWeather();
      await loadForecastWeather();
      hasData = true;
    } catch (e) {
      hasData = false;
      throw Exception(e);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> loadForecastWeather() async {
    try {
      _forecastWeather = await _forecastWeatherRepository.fetchData();
    } catch (e) {
      error = "VM: Nie udało się wczytać prognozy pogody $e";
      throw Exception(error);
    }
  }

  Future<void> loadCurrentWeather() async {
    try {
      _weather = await _currentWeatherRepository.fetchData();
    } catch (e) {
      error = "VM: Nie udało się wczytać pogody $e";
      throw Exception(error);
    }
  }
}
