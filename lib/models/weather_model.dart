// descriptions copied from https://openweathermap.org/api/current?collection=current_forecast

import 'dart:core';

import 'package:flutter/material.dart';

class Weather {
  final String city;

  // Units of measurement. standard, metric and imperial units are available.
  final String units = "metric";

  // temperature
  final String temperature;
  final String feelsTemperature;

  final String minTemp;
  final String maxTemp;

  // Group of weather parameters (Rain, Snow, Clouds etc.)
  final WeatherType weatherType;

  // Code between 1
  final int weatherIcon;

  final bool isDay;

  final String weatherDescription;

  final String pressure;
  final String humidity;

  final String windSpeed;
  final String windDeg;

  // Cloudiness, %
  final String cloudiness;

  // time
  final DateTime time;

  Widget get image => WeatherImage(weatherIcon: weatherIcon).getImage();

  //formated temperature : 20.4214 -> 20
  String get fTemperature => double.parse(temperature).truncate().toString();
  String get fFeelsLike => double.parse(feelsTemperature).truncate().toString();

  Weather({
    required this.city,
    required this.temperature,
    required this.feelsTemperature,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherType,
    required this.weatherIcon,
    required this.isDay,
    required this.weatherDescription,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.cloudiness,
    required this.time,
  });

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

enum WeatherType { rain, snow, clouds, clear, thunderstorm }

class WeatherImage {
  // icon number
  final int _weatherIcon;

  WeatherImage({required this._weatherIcon});

  // Converts int to String based on https://openweathermap.org/api/weather-conditions
  String iconToString(int icon) {
    return switch (icon) {
      1 => 'clear',
      2 => 'few_clouds',
      3 => 'scatt_clouds',
      4 => 'clouds',
      9 => 'heavy_rain',
      10 => 'rain',
      11 => 'thunderstorm',
      13 => 'snow',
      50 => 'mist',
      _ => 'clear',
    };
  }

  Widget getImage() {
    return Image.asset("assets/images/${iconToString(_weatherIcon)}.png");
  }
}
