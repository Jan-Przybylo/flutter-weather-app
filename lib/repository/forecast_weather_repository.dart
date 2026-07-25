import 'dart:convert';

import 'package:weather/core/constants.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/services/forecast_weather_api.dart';

import '../models/weather_model.dart';

class ForecastWeatherRepository {
  final City city;
  ForecastWeatherRepository({required this.city});

  ForecastWeatherApi api = ForecastWeatherApi();


  //https://openweathermap.org/api/forecast5?collection=current_forecast#5days
  Future<List<Weather>?> fetchData() async {
    final String unformatedWeather;
    try {
      unformatedWeather = await api.getWeather(debug: debug, city: city);
    } catch (e) {
      throw Exception("Nie udało się pobrać pogody!");
    }

    return stringToWeather(unformatedWeather);
  }

  List<Weather>? stringToWeather(String input) {
    final list = jsonDecode(input);
    List<Weather> output = [];
    for (final temp in list['list']) {
      final WeatherType type = Weather.stringToWeatherType(
        temp['weather'][0]['main'].toString(),
      );
      bool isDay = temp['weather'][0]['icon'][2] == 'd';

      final String icon = temp['weather'][0]['icon'].toString().substring(0, 2);

      output.add(
        Weather(
          city: city.name,
          temperature: temp['main']['temp'].toString(),
          feelsTemperature: temp['main']['feels_like'].toString(),
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
          time: DateTime.fromMicrosecondsSinceEpoch(temp['dt'] * 1000 * 1000), // api is in seconds
        ),
      );
    }

    return output;
  }

}
