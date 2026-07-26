class City {
  final String name;
  final String? country;
  final String? state;
  final String lat;
  final String lon;

  bool saved = false;

  String get fullName {
    final String c = (country == null) ?  '' : ', $country';
    final String s = (state == null) ? '' : ', $state';
    return '$name$c$s';
  }

  City({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  Map<String, dynamic> toJson() => {'name': name, 'country': country, 'state': state, 'lat': lat, 'lon':lon};

  City.fromJson(Map<String, dynamic> json):
    name = json['name'] as String,
    country = json['country'] as String,
    state = json['state'] as String,
    lat = json['lat'] as String,
    lon = json['lon'] as String;


  bool isEmpty()
  {
    if (name.isEmpty || name == "") return true;
    return false;
  }

  @override
  bool operator ==(Object other) {
    if (other is! City) return false;
    if (other.name == name && other.lat == lat && other.lon == lon && other.saved == saved) return true;
    return false;
  }

  @override
  int get hashCode => Object.hash(name, lat, lon, saved);
}
