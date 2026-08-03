import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/features/weather/presentation/effects/weather_clear_effect.dart';
import 'package:weather/features/weather/presentation/effects/weather_clouds_effect.dart';
import 'package:weather/features/weather/presentation/effects/weather_rain_effect.dart';
import 'package:weather/features/weather/presentation/effects/weather_thunderstorm_effect.dart';

abstract class WeatherCustomEffect extends StatefulWidget
{

  Gradient get backgroundGradient;

  const WeatherCustomEffect({super.key});

}


class WeatherEffects {
  final WeatherType? type;
  WeatherEffects({this.type});

  WeatherCustomEffect get backgroundEffect {
    return switch(type){
    WeatherType.clear => WeatherClearEffect(),
    WeatherType.rain => WeatherRainEffect(),
    WeatherType.snow => WeatherRainEffect(), // TODO
    WeatherType.clouds => WeatherCloudsEffect(),
    WeatherType.thunderstorm => WeatherThunderstormEffect(),
    _ => WeatherClearEffect()
  }; }
}