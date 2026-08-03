import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/core/widgets/line.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/core/widgets/animated_fake_glass.dart';
import 'package:weather/features/weather/presentation/utils/weather_image_mapper.dart';

class MainWeatherCard extends StatelessWidget {
  final WeatherEntity weather;
  const MainWeatherCard({super.key, required this.weather});
  @override
  Widget build(BuildContext context) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weather.city,
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
                        '${weather.fTemperature}$degreeSymbol',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: WeatherImage.getImage(weather.weatherIcon),
                  ),
                ),
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
                          text: '${weather.minTemp}$degreeSymbol',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: " to "),
                        TextSpan(
                          text: '${weather.maxTemp}$degreeSymbol',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Line(),
                    Text(
                      weather.weatherDescription,
                      textAlign: TextAlign.center,
                    ),
                    Line(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
