import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  Future<FullWeatherEntity> call({required CityEntity city})
  {
    return _weatherRepository.getWeather(city: city);
  }

}