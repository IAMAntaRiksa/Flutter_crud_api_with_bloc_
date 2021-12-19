import 'package:crud/ui/dashboard/dashboard_screen.dart';
import 'package:crud/ui/home/add/person_screen.dart';
import 'package:crud/ui/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case EditPersonScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const EditPersonScreen(
                  newPerson: true,
                ));

      // case MovieDetailScreen.routeName:
      //   var movieArgs = settings.arguments as MovieDetailArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailScreen(args: movieArgs),
      //   );
    }
  }
}
