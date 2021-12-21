import 'package:crud/data/model/person.dart';
import 'package:crud/ui/dashboard/dashboard_screen.dart';
import 'package:crud/ui/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static late final Person person;
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      // case MovieDetailScreen.routeName:
      //   var movieArgs = settings.arguments as MovieDetailArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailScreen(args: movieArgs),
      //   );
    }
  }
}
