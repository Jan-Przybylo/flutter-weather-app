import 'package:equatable/equatable.dart';

class CityEntity with Equatable{
  final String name;
  final String? country;
  final String? state;
  final String lat;
  final String lon;


  String get fullName {
    final String c = (country == null) ? '' : ', $country';
    final String s = (state == null) ? '' : ', $state';
    return '$name$c$s';
  }

  const CityEntity({
    required this.name,
    required this.lat,
    required this.lon,
    this.country,
    this.state,
  });
  
  @override
  List<Object?> get props => [name,lat,lon];

}
