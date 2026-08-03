import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/data/data_sources/weather_api.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

class CurrentWeatherApi implements WeatherApi{
  @override
  Future<WeatherModel> getWeather({required CityEntity city}) async {
    final String apiKey = dotenv.env['API_KEY'] ?? "";
    if (apiKey == "") throw Exception("Brakuje klucza API!");
    final url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
      'lat': city.lat.toString(),
      'lon': city.lon.toString(),
      'units': 'metric',
      'appid': apiKey,
    });

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to get data: $response");
    }
    return WeatherModel.fromMap(jsonDecode(response.body), city.name);
  }
}
