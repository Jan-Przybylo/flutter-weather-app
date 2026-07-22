import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather/viewmodels/weather_view_model.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final String city;
  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // image: DecorationImage(image: AssetImage("assets/images/test.png")),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          colors: [CupertinoColors.systemBlue, CupertinoColors.systemTeal],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          ListenableBuilder(
            listenable: vm,
            builder: (context, child) {
              if (vm.hasData == false || vm.loading == true) {
                return CupertinoActivityIndicator(radius: 40);
              }
              return mainWeather(context, vm.weather!);
            },
          ),
        ],
      ),
    );
  }

  Widget mainWeather(BuildContext context, Weather w) {
    final String temperature = double.parse(
      w.temperature,
    ).truncate().toString();
    return LiquidGlassLayer(
      settings: const LiquidGlassSettings(
        thickness: 4,
        blur: 2,
        glassColor: Color.fromARGB(41, 255, 255, 255),
      ),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 50),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      w.city,
                      style: TextStyle(
                        fontSize: 25,
                        color: CupertinoColors.white,
                      ),
                    ),
                    Icon(Icons.pin_drop_outlined,color: CupertinoColors.white,)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          temperature,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Center(child: w.image)),
                ],
              ),
              Row(
                children: [
                  line(context),
                  Text(w.weatherDescription, textAlign: TextAlign.center),
                  line(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget line(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 0.5,
          width: 1000,
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    vm = WeatherViewModel(city: widget.city);
    vm.loadWeather();
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
  }
}
