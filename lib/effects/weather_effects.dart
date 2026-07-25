import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_clear_effect.dart';
import 'package:weather/effects/weather_thunderstorm_effect.dart';
import 'package:weather/models/weather_model.dart';

abstract class WeatherCustomEffect extends StatefulWidget
{

  @override
  Gradient get backgroundGradient;

  const WeatherCustomEffect({super.key});

}


//WIP
class WeatherEffects {
  final WeatherType type;
  WeatherEffects({required this.type});

  WeatherCustomEffect get backgroundEffect {
    return switch(type){
    WeatherType.clear => WeatherClearEffect(),
    WeatherType.rain => WeatherThunderstormEffect(),
    WeatherType.snow => WeatherThunderstormEffect(),
    WeatherType.clouds => WeatherThunderstormEffect(),
    WeatherType.thunderstorm => throw UnimplementedError(),
    _ => WeatherThunderstormEffect(),
  }; }


 
}