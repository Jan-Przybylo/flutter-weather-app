import 'package:flutter/cupertino.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/constants/animation_duration.dart';
import 'package:weather/features/weather/presentation/effects/weather_effects.dart';
import 'package:weather/features/weather/presentation/effects/weather_rain_effect.dart';

class WeatherThunderstormEffect extends WeatherCustomEffect {
  const WeatherThunderstormEffect({super.key});

  @override
  State<WeatherThunderstormEffect> createState() =>
      _WeatherThunderstormEffectState();

  @override
  Gradient get backgroundGradient => clouds;
}

class _WeatherThunderstormEffectState extends State<WeatherThunderstormEffect> {
  double lightningOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: lightningWidget());
  }

  Widget lightningWidget() {
    return IgnorePointer(
      child: Stack(
        children: [
          WeatherRainEffect(),
          AnimatedOpacity(
            opacity: lightningOpacity,
            duration: Duration(seconds: 1),
            curve: Curves.bounceInOut,
            child: Container(decoration: BoxDecoration(gradient: lightning)),
          ),
        ],
      ),
    );
  }

  void doLightning() async {
    if (!mounted) return;
    setState(() {
      lightningOpacity = 1.0;
    });
    await Future.delayed(Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      lightningOpacity = 0.0;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(delayBetweenLighting, doLightning);
    if (!mounted) return;
  }
}
