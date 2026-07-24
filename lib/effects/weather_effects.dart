import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_thunderstorm_effect.dart';
import 'package:weather/models/weather_model.dart';

class WeatherEffects extends StatefulWidget {
  final WeatherType type;
  final WeatherCustomEffect weatherTypeEffect = WeatherThunderstormEffect();

  WeatherEffects({super.key, required this.type});

  @override
  State<WeatherEffects> createState() => _WeatherEffectsState();
}

class _WeatherEffectsState extends State<WeatherEffects> {

  

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: widget.weatherTypeEffect);
  }

 
}

abstract class WeatherCustomEffect extends StatefulWidget
{
  const WeatherCustomEffect({super.key});

}
