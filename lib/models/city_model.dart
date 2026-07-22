class City {
  final String name;
  final String country;
  final String state;
  final String lat;
  final String lon;

  City({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  @override
  bool operator ==(Object other) {
    if (other is! City) return false;
    if (other.name == name && other.lat == lat && other.lon == lon) return true;
    return false;
  }

  @override
  int get hashCode => Object.hash(name, lat, lon);
}
