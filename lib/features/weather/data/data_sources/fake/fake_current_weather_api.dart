import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/data/data_sources/weather_api.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class FakeCurrentWeatherApi implements WeatherApi {
  @override
  Future<WeatherModel> getWeather({required CityEntity city}) async {
    await Future.delayed(Duration(seconds: 1));
    final response = {
      "coord": {"lon": 10.99, "lat": 44.34},
      "weather": [
        {
          "id": 804,
          "main": "Thunderstorm",
          "description": "overcast clouds",
          "icon": "11d",
        },
      ],
      "base": "stations",
      "main": {
        "temp": 25.43,
        "feels_like": 25.46,
        "temp_min": 24.81,
        "temp_max": 26.16,
        "pressure": 1017,
        "humidity": 55,
        "sea_level": 1017,
        "grnd_level": 952,
      },
      "visibility": 10000,
      "wind": {"speed": 2.95, "deg": 51, "gust": 2.48},
      "clouds": {"all": 95},
      "dt": 1784726892,
      "sys": {
        "type": 2,
        "id": 2004688,
        "country": "IT",
        "sunrise": 1784692333,
        "sunset": 1784746343,
      },
      "timezone": 7200,
      "id": 3163858,
      "name": "Zocca",
      "cod": 200,
    };
    return WeatherModel.fromMap(response);
  }
}
