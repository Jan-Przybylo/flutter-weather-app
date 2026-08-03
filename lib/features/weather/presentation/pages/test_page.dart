import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/dependency_injection.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';

class TestPage extends StatelessWidget {
  final CityEntity city;
  const TestPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocProvider(
          create: (context) => getIt<WeatherCubit>()..loadData(city: city),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return switch (state) {
                WeatherSuccess() => Text("Success"),
                WeatherFailure() => Text("Failure"),
                WeatherLoading() => Text("Loading"),
                _ => Text("err"),
              };
            },
          ),
        ),
      
    );
  }
}
