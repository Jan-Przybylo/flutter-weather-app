

import 'package:weather/core/domain/entities/city_entity.dart';

/// class that returns model based on Api
abstract class WeatherApi {
  Future<dynamic> getWeather({required CityEntity city});
}