import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/constants/animation_duration.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/effects/weather_effects.dart';
import 'package:weather/features/weather/presentation/widgets/weather_content.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: black,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          final WeatherEffects effect = switch (state) {
            WeatherLoading() => WeatherEffects(),
            WeatherSuccess() => WeatherEffects(
              type: state.weather.currentWeather.weatherType,
            ),
            WeatherFailure() || _ => WeatherEffects(),
          };

          return Stack(
            children: [
              // Main content
              AnimatedContainer(
                duration: gradientAnimationDuration,
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: effect.backgroundEffect.backgroundGradient,
                ),
                child: switch (state) {
                  WeatherLoading() => loadingState(context),
                  WeatherSuccess() => WeatherContent(weather: state.weather),
                  WeatherFailure() || _ => Text("failure"), //TODO
                },
              ),
              // Weather efects
              switch (state) {
                WeatherLoading() => SizedBox.shrink(),
                WeatherSuccess() => WeatherEffects(
                  type: state.weather.currentWeather.weatherType,
                ).backgroundEffect,
                WeatherFailure() || _ => SizedBox.shrink(),
              },
            ],
          );
        },
      ),
    );
  }

  Widget loadingState(BuildContext context) {
    return CupertinoActivityIndicator(radius: 50);
  }
}