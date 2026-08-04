import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/constants/animation_duration.dart';
import 'package:weather/core/exception/api_exception.dart';
import 'package:weather/core/exception/weather_exception.dart';
import 'package:weather/core/widgets/alert.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';
import 'package:weather/features/weather/presentation/effects/weather_effects.dart';
import 'package:weather/features/weather/presentation/widgets/weather_content.dart';
import 'package:weather/l10n/app_localizations.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: black,
      child: BlocConsumer<WeatherCubit, WeatherState>(
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
                  WeatherFailure() || _ => SizedBox.shrink(),
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
        //handle errors
        listenWhen: (previous, current) => (!Alert.isShow),
        listener: (context, state) {
          if(state is WeatherFailure) Navigator.of(context).pop();
          return switch (state) {
            WeatherFailure(exception: ApiNotFoundException()) => Alert.show(
              context,
              title: AppLocalizations.of(context)!.error,
              message: AppLocalizations.of(context)!.emANF,
            ),
            WeatherFailure(exception: WeatherApiException()) => Alert.show(
              context,
              title: AppLocalizations.of(context)!.error,
              message: AppLocalizations.of(context)!.emS,
            ),

            WeatherState() => null,
          };

        },
      ),
    );
  }

  Widget loadingState(BuildContext context) {
    return CupertinoActivityIndicator(radius: 50);
  }
}
