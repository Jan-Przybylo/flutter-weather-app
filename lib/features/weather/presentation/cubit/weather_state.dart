import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';

abstract class WeatherState {}

class WeatherFailure implements WeatherState {}

class WeatherLoading implements WeatherState {}

class WeatherSuccess implements WeatherState {
  final FullWeatherEntity weather;
  WeatherSuccess({required this.weather});
}

