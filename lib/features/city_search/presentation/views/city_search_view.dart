import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/exception/api_exception.dart';
import 'package:weather/core/exception/city_search_exception.dart';
import 'package:weather/core/widgets/alert.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/city_search/presentation/cubits/city_state.dart';
import 'package:weather/features/city_search/presentation/widgets/city_button_widget.dart';
import 'package:weather/features/city_search/presentation/widgets/city_search_text_field.dart';
import 'package:weather/l10n/app_localizations.dart';

class CitySearchView extends StatelessWidget {
  const CitySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: white,
      child: CupertinoListSection.insetGrouped(
        header: SafeArea(
          child: Text(
            AppLocalizations.of(context)!.searchTitle,
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
          BlocConsumer<CityCubit, CityState>(
            builder: ((context, state) {
              return switch (state) {
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
                _ => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.emptyList),
                ),
              };
            }),
            listenWhen: (previous, current) => (!Alert.isShow),
            listener: (context, state) {
              return switch (state) {
                CityFailure(exception: ApiNotFoundException()) => Alert.show(
                  context,
                  title: AppLocalizations.of(context)!.error,
                  message: AppLocalizations.of(context)!.emANF,
                ),
                CityFailure(exception: CitySearchApiException()) => Alert.show(
                  context,
                  title: AppLocalizations.of(context)!.error,
                  message: AppLocalizations.of(context)!.emS,
                ),

                CityState() => null,
              };
            },
          ),
        ],
      ),
    );
  }
}
