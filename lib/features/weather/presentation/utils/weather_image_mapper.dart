import 'package:flutter/cupertino.dart';

class WeatherImage {
  /// Converts int to String based on https://openweathermap.org/api/weather-conditions
  static String iconToString(int icon) {
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

  static Widget getImage(int icon) {
    return Image.asset("assets/images/${iconToString(icon)}.png");
  }
}
