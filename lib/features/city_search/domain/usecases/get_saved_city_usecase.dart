import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/domain/repositories/city_repository.dart';

class GetSavedCityUsecase {
  final CityRepository _repository;
  GetSavedCityUsecase({required this._repository});
  
  Future<CityEntity?> load()
  {
    return _repository.loadLocalCity();
  }
}