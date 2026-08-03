import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/domain/usecases/get_cities_usecase.dart';
import 'package:weather/features/city_search/domain/usecases/get_saved_city_usecase.dart';
import 'package:weather/features/city_search/domain/usecases/save_city_usecase.dart';
import 'package:weather/features/city_search/presentation/cubits/city_state.dart';

class CityCubit extends Cubit<CityState> {
  final GetCitiesUseCase _getCitiesUseCase;
  final SaveCityUseCase _saveCityUseCase;
  final GetSavedCityUsecase _getSavedCityUsecase;

  CityEntity? savedCity;
  CitySuccess lastSuccessState = CitySuccess(cities: {});

  CityCubit({
    required this._getCitiesUseCase,
    required this._saveCityUseCase,
    required this._getSavedCityUsecase,
  }) : super(CityInit());

  Future<void> queryCity({required String cityQuery}) async {
    emit(CitySearchLoading());
    try {
      final cities = await _getCitiesUseCase.getCities(cityQuery: cityQuery);
      lastSuccessState = CitySuccess(cities: cities, saved: savedCity);
      emit(lastSuccessState);
    } catch (e) {
      throw UnimplementedError('$e');
    }
  }

  void saveCity({required CityEntity city}) {
    _saveCityUseCase.save(city: city);
    loadSavedCity();
  }

  Future<void> loadSavedCity() async {
    emit(CitySavedLoding());
    final savedCity = await _getSavedCityUsecase.load();
    this.savedCity = savedCity;
    if (savedCity == null) {
      emit(CityReady());
    } else {
      emit(CitySuccess(cities: {}, saved: savedCity));
    }
    debugPrint(savedCity!.fullName);
  }
}
