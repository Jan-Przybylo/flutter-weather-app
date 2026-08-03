import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/city_search/presentation/cubits/city_state.dart';
import 'package:weather/features/city_search/presentation/widgets/city_button_widget.dart';
import 'package:weather/features/city_search/presentation/widgets/city_search_text_field.dart';

class CitySearchView extends StatelessWidget {
  const CitySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: white,
      child: CupertinoListSection.insetGrouped(
        header: SafeArea(
          child: Text(
            "Search for a city",
            style: TextStyle(color: CupertinoColors.black),
          ),
        ),
        children: [
          BlocProvider.value(
            value: context.read<CityCubit>(),
            child: CitySearchTextField(
              onSearch: (value) {
                context.read<CityCubit>().queryCity(cityQuery: value);
              },
            ),
          ),
          BlocBuilder<CityCubit, CityState>(
            builder: ((context, state) {
              return switch (state) {
                CityReady() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Empty list'),
                ),
                CitySearchLoading() => Text(CitySearchLoading.message),
                CitySuccess() => Column(
                  children: [
                    for (final city in state.cities)
                      BlocProvider.value(
                        value: context.read<CityCubit>(),
                        child: CityButton(city: city),
                      ),
                    if (state.saved != null)
                      BlocProvider.value(
                        value: context.read<CityCubit>(),
                        child: CityButton(city: state.saved!, isSaved: true),
                      ),
                  ],
                ),
                _ => Text("err"),
              };
            }),
          ),
        ],
      ),
    );
  }
}
