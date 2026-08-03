class ApiNotFoundException implements Exception {
  final Object? error;
  ApiNotFoundException([this.error]);
}
