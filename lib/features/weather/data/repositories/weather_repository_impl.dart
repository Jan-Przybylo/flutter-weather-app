import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/data/data_sources/weather_api.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  final WeatherApi _currentWeatherApi;
  final WeatherApi _forecastWeatherApi;

  WeatherRepositoryImpl({required this._currentWeatherApi, required this._forecastWeatherApi});

  @override
  Future<FullWeatherEntity> getWeather({required CityEntity city}) async{
    final WeatherEntity currentWeather;
    final List<WeatherEntity> forecastWeather;
    try {
      currentWeather = await _currentWeatherApi.getWeather(city: city);
      forecastWeather = await _forecastWeatherApi.getWeather(city: city);
    } catch (_) {
      rethrow;
    }

    return FullWeatherEntity(currentWeather: currentWeather, forecastWeather: forecastWeather);
  }
}