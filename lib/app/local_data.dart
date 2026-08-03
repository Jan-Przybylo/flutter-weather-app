import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/domain/usecases/get_saved_city_usecase.dart';

class LocalData {
  final GetSavedCityUsecase _getSavedCityUsecase;
  LocalData({required this._getSavedCityUsecase});

  Future<CityEntity?> loadSavedCity() async
  {
    return _getSavedCityUsecase.load(); // TODO zla architektura 
  }
}