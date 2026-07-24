import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_effects.dart';

class WeatherThunderstormEffect extends WeatherCustomEffect {
  const WeatherThunderstormEffect({super.key});

  @override
  State<WeatherThunderstormEffect> createState() => _WeatherThunderstormEffectState();
}

class _WeatherThunderstormEffectState extends State<WeatherThunderstormEffect> {
  double lightningOpacity = 0.0;


  @override
  Widget build(BuildContext context) {
    return lightningWidget();
  }

  Widget lightningWidget() {
    return AnimatedOpacity(
      opacity: lightningOpacity,
      duration: Duration(seconds: 1),
      curve: Curves.bounceInOut,
      child: Container(decoration: BoxDecoration(gradient: lightning)),
    );
  }

  void doLightning() async {
    setState(() {
      lightningOpacity = 1.0;
    });
    await Future.delayed(Duration(seconds: 1));
    if(!mounted) return;
    setState(() {
      lightningOpacity = 0.0;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), doLightning);
    if(!mounted) return;

  }
  
  
}
