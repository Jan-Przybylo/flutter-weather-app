import 'package:flutter/material.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/core/widgets/animated_fake_glass.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/presentation/utils/weather_image_mapper.dart';

class ForecastWeatherCard extends StatelessWidget {
  final List<WeatherEntity> _forecastWeather;
  const ForecastWeatherCard({super.key, required this._forecastWeather});
  @override
  Widget build(BuildContext context) {
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
                    for (final w in _forecastWeather)
                      smallWeatherIcon(
                        context,
                        w,
                        first: (_forecastWeather.first == w),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallWeatherIcon(
    BuildContext context,
    WeatherEntity w, {
    bool first = false,
  }) {
    final time = first ? "Now" : w.time.hour.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: Text(time)),
          Expanded(flex: 1, child: WeatherImage.getImage(w.weatherIcon)),
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
}
