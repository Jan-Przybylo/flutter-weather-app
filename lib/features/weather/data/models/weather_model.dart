// descriptions copied from https://openweathermap.org/api/current?collection=current_forecast

import 'dart:core';

import 'package:weather/core/constants/constants.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.city,
    required super.temperature,
    required super.feelsTemperature,
    required super.minTemp,
    required super.maxTemp,
    required super.weatherType,
    required super.weatherIcon,
    required super.isDay,
    required super.weatherDescription,
    required super.pressure,
    required super.humidity,
    required super.windSpeed,
    required super.windDeg,
    required super.cloudinessPercentage,
    required super.time,
  });

  WeatherModel.fromMap(Map<String, dynamic> map, [String? cityName])
    : super(
        city: cityName ?? map['name'],
        temperature: map['main']['temp'].toString(),
        feelsTemperature: map['main']['feels_like'].toString().toString(),
        minTemp: map['main']['temp_min'].toString(),
        maxTemp: map['main']['temp_max'].toString(),
        weatherType: WeatherModel.stringToWeatherType(map['weather'][0]['main']),
        weatherIcon: int.parse(map['weather'][0]['icon'].toString().substring(0,2)),
        isDay: (map['weather'][0]['icon'][2] == 'd'),
        weatherDescription: map['weather'][0]['description'].toString(),
        pressure: map['main']['pressure'].toString(),
        humidity: map['main']['humidity'].toString(),
        windSpeed: map['wind']['speed'].toString(),
        windDeg: map['wind']['deg'].toString(),
        cloudinessPercentage: map['clouds']['all'].toString(),
        time: DateTime.fromMicrosecondsSinceEpoch(map['dt'] * fromMicrosecondsToSeconds),
      );

  static List<WeatherModel> fromMapToList(Map<String, dynamic> map)
  {
    List<WeatherModel> output = [];
    final String city = map['city']['name']; 
    for (final temp in map['list']) {

      output.add(
        WeatherModel.fromMap(temp, city)
      );
    }

    return output;
  }

  static WeatherType stringToWeatherType(String input) {
    return switch (input.toLowerCase()) {
      "rain" || "drizzle" => WeatherType.rain,
      "snow" => WeatherType.snow,
      "clouds" ||
      "mist" ||
      "haze" ||
      "smoke" ||
      "dust" ||
      "fog" ||
      "sand" ||
      "ash" ||
      "squall" ||
      "tornado" => WeatherType.clouds,
      "clear" => WeatherType.clear,
      "thunderstorm" => WeatherType.thunderstorm,
      _ => WeatherType.clear,
    };
  }
}
