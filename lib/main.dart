import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather/app/app.dart';
import 'package:weather/app/local_data.dart';
import 'package:weather/app/router/app_router.dart';
import 'package:weather/core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  loadLocator();

  // TODO zla architektura
  final AppRouter appRouter = AppRouter(await getIt<LocalData>().load());

  runApp(WeatherApp(appRouter: appRouter));
}