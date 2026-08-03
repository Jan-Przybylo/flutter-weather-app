import 'package:weather/core/constants/constants.dart';

class WeatherEntity {
  final String city;

  final String units = "metric";

  final String temperature;
  final String feelsTemperature;

  final String minTemp;
  final String maxTemp;

  final WeatherType weatherType;

  final int weatherIcon;

  final bool isDay;

  final String weatherDescription;

  final String pressure;
  final String humidity;

  final String windSpeed;
  final String windDeg;

  final String cloudinessPercentage;

  final DateTime time;

  //formated temperature : 20.4214 -> 20
  String get fTemperature => double.parse(temperature).truncate().toString();
  String get fFeelsLike => double.parse(feelsTemperature).truncate().toString();

  WeatherEntity({
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
    required this.cloudinessPercentage,
    required this.time,
  });
}