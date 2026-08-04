import 'package:equatable/equatable.dart';
import 'package:weather/core/domain/entities/city_entity.dart';

abstract class CityState {}

class CityInit extends CityState {}

class CitySavedLoding extends CityState {}

class CityReady extends CityState {}

class CitySearchLoading extends CityState {}

class CitySuccess extends CityState {
  final Set<CityEntity> cities;
  final CityEntity? saved;
  CitySuccess({required this.cities, this.saved});
}

class CityFailure extends CityState with Equatable {
  final Exception? exception;
  CityFailure({this.exception});

  @override
  List<Object?> get props => [exception.toString()];
}
