import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/dependency_injection.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/city_search/presentation/views/city_search_view.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //lazy: false, //TODO dowiedziec sie
      create: (context) => getIt<CityCubit>()..loadSavedCity(),
      child: CitySearchView(),
    );
  }
}