import 'package:flutter/cupertino.dart';
import 'package:weather/app/router/app_router.dart';
import 'package:weather/core/constants/constants.dart';


class WeatherApp extends StatelessWidget {
  final AppRouter appRouter;
  
  WeatherApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: debug,
      onGenerateRoute: appRouter.onGenerateRoute,
      onGenerateInitialRoutes: appRouter.onGenerateInitialRoutes,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
        brightness: Brightness.light,
      ),
    );
  }
}
