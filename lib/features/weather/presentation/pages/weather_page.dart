import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/di/dependency_injection.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather/features/weather/presentation/views/weather_view.dart';

class WeatherPage extends StatelessWidget {
  final CityEntity city;
  const WeatherPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: white),
      child: BlocProvider(
        create: (context) => getIt<WeatherCubit>()..loadData(city: city),
        child: WeatherView(),
      ),
    );
  }

}
