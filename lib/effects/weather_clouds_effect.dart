import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_effects.dart';

class WeatherCloudsEffect extends WeatherCustomEffect {
  const WeatherCloudsEffect({super.key});

  @override
  State<WeatherCloudsEffect> createState() => _WeatherCloudsEffectState();
  
  @override
  Gradient get backgroundGradient => clouds;
}

class _WeatherCloudsEffectState extends State<WeatherCloudsEffect> {


  
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: SizedBox.shrink()); // nothing
  }
}