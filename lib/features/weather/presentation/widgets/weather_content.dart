import 'package:flutter/cupertino.dart';
import 'package:weather/features/weather/domain/entities/full_weather_entity.dart';
import 'package:weather/features/weather/presentation/widgets/extra_information_cards.dart';
import 'package:weather/features/weather/presentation/widgets/forecast_weather_card.dart';
import 'package:weather/features/weather/presentation/widgets/main_weather_card.dart';

class WeatherContent extends StatelessWidget {
  final FullWeatherEntity _weather;
  const WeatherContent({super.key, required this._weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          spacing: 8.0,
          children: [
            MainWeatherCard(weather: _weather.currentWeather),
            ForecastWeatherCard(forecastWeather: _weather.forecastWeather),
            ExtraInformationCards(weather: _weather.currentWeather),
          ],
        ),
      ),
    );
  }
}
