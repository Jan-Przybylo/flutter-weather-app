import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_effects.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/pages/city_search_page.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/widgets/animated_fake_glass.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final City city;
  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late WeatherViewModel vm;
  Gradient typeOfGradient = clear;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(gradient: typeOfGradient),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),

                  ListenableBuilder(
                    listenable: vm,
                    builder: (context, child) {
                      if (vm.hasData == false || vm.loading == true) {
                        return Center(
                          child: CupertinoActivityIndicator(radius: 40),
                        );
                      }

                      return pageContent(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          ListenableBuilder(
            listenable: vm,
            builder: (context, child) {
              if (vm.hasData == false || vm.loading == true) {
                return SizedBox.shrink();
              }
              return WeatherEffects(type: vm.weather!.weatherType);
            },
          ),
        ],
      ),
    );
  }

  Widget pageContent(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        mainWeather(context, vm.weather!),
        futureWeather(context, vm.forecastWeather!),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: weatherCard(
                context,
                title: Row(
                  children: [
                    Icon(
                      CupertinoIcons.thermometer,
                      color: CupertinoColors.white,
                    ),
                    Text(" Feels like"),
                  ],
                ),
                text: '${vm.weather!.fFeelsLike}$degreeSymbol',
              ),
            ),
            Expanded(
              child: weatherCard(
                context,
                title: Row(
                  children: [
                    Icon(
                      CupertinoIcons.speedometer,
                      color: CupertinoColors.white,
                    ),
                    Text(" Pressure"),
                  ],
                ),
                text: '${vm.weather!.pressure} hPa',
              ),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: weatherCard(
                context,
                title: Row(
                  children: [
                    Icon(CupertinoIcons.wind, color: CupertinoColors.white),
                    Text(" Wind speed"),
                  ],
                ),
                text: '${vm.weather!.windSpeed} m/s',
              ),
            ),
            Expanded(
              child: weatherCard(
                context,
                title: Row(
                  children: [
                    Icon(
                      CupertinoIcons.arrow_up_right,
                      color: CupertinoColors.white,
                    ),
                    Text(" Wind direction"),
                  ],
                ),
                text: '${vm.weather!.windDeg}$degreeSymbol deg',
              ),
            ),
          ],
        ),
        wideWeatherCard(
          context,
          title: Row(
            children: [
              Icon(CupertinoIcons.cloud, color: CupertinoColors.white),
              Text(" Cloudiness"),
            ],
          ),
          left: Text(
            '${vm.weather!.cloudiness}%',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          right: vm.weather!.image,
        ),
      ],
    );
  }

  Widget mainWeather(BuildContext context, Weather w) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => CitySearchPage()),
                  (route) => false,
                );
              },
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
                  Icon(Icons.pin_drop_outlined, color: CupertinoColors.white),
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
                        '${w.fTemperature}$degreeSymbol',
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
            Column(
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "from "),
                        TextSpan(
                          text: '${w.minTemp}$degreeSymbol',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " to "),
                        TextSpan(
                          text: '${w.maxTemp}$degreeSymbol',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }

  Widget futureWeather(BuildContext context, List<Weather> fw) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Forecast"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    for (final w in fw)
                      smallWeatherIcon(context, w, first: (fw.first == w)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget weatherCard(
    BuildContext context, {
    required Widget title,
    required String text,
  }) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Column(
            children: [
              Row(children: [line(context), title, line(context)]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget smallWeatherIcon(
    BuildContext context,
    Weather w, {
    bool first = false,
  }) {
    final time = first ? "Now" : w.time.hour.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: Text(time)),
          Expanded(flex: 1, child: w.image),
          Expanded(
            flex: 1,
            child: Text(
              '${w.fTemperature}$degreeSymbol',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget wideWeatherCard(
    BuildContext context, {
    required Widget title,
    required Widget left,
    required Widget right,
  }) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(children: [line(context), title, line(context)]),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(fit: BoxFit.contain, child: left),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  void changeBackgroundGradient() {
    if (vm.hasData || !vm.loading) {
      setState(() {
        typeOfGradient = clouds;
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    vm = WeatherViewModel(city: widget.city);
    vm.loadWeather();

    vm.addListener(changeBackgroundGradient);
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
  }
}
