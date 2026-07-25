import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_effects.dart';

class WeatherClearEffect extends WeatherCustomEffect {
  const WeatherClearEffect({super.key});

  @override
  State<WeatherClearEffect> createState() => _WeatherClearEffectState();
  
  @override
  Gradient get backgroundGradient => clear;
}

class _WeatherClearEffectState extends State<WeatherClearEffect> {


  
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: SizedBox.shrink()); // nothing
  }
}