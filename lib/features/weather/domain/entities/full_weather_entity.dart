import 'package:weather/features/weather/domain/entities/weather_entity.dart';

// weather info with forecast weather (list of weatherEtities)
class FullWeatherEntity {
  final WeatherEntity currentWeather;
  final List<WeatherEntity> forecastWeather;
  FullWeatherEntity({
    required this.currentWeather,
    required this.forecastWeather,
  });
}
