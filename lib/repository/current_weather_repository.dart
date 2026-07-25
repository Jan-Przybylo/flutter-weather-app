import 'dart:convert';

import 'package:weather/core/constants.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/services/current_weather_api.dart';

import '../models/weather_model.dart';

class CurrentWeatherRepository {
  final City city;
  CurrentWeatherRepository({required this.city});

  CurrentWeatherApi api = CurrentWeatherApi();

  Future<Weather?> fetchData() async {
    final String unformatedWeather;
    try {
      unformatedWeather = await api.getWeather(debug: debug, city: city);
    } catch (e) {
      throw Exception("Nie udało się pobrać pogody!");
    }

    return stringToWeather(unformatedWeather);
  }

  Weather? stringToWeather(String input) {

    final temp = jsonDecode(input);
    final WeatherType type = Weather.stringToWeatherType(temp['weather'][0]['main'].toString());
    bool isDay = temp['weather'][0]['icon'][2] == 'd';

    final String icon = temp['weather'][0]['icon'].toString().substring(0,2);

    Weather output = Weather(
      city: temp['name'],
      temperature: temp['main']['temp'].toString(),
      feelsTemperature: temp['main']['feels_like'].toString().toString(),
      minTemp: temp['main']['temp_min'].toString(),
      maxTemp: temp['main']['temp_max'].toString(),
      weatherType: type,
      weatherIcon: int.parse(icon),
      isDay: isDay,
      weatherDescription: temp['weather'][0]['description'].toString(),
      pressure: temp['main']['pressure'].toString(),
      humidity: temp['main']['humidity'].toString(),
      windSpeed: temp['wind']['speed'].toString(),
      windDeg: temp['wind']['deg'].toString(),
      cloudiness: temp['clouds']['all'].toString(),
      time: DateTime.fromMicrosecondsSinceEpoch(temp['dt'])
    );

    return output;
  }

}
