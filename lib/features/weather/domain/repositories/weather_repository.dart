import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

abstract class WeatherRepository {
  Future<FullWeatherEntity> getWeather({required CityEntity city});
}