import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/routes_exports.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (context) => const SpalshScreen());
      case 'login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case 'details':
        var params = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => DetailScreen(index: params));
      case 'watch':
        return MaterialPageRoute(builder: (context) => const WatchScreen());
      case 'home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case 'popular':
        return MaterialPageRoute(builder: (context) => const PopularScreen());
      case 'Favorites':
        return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      case 'recent':
        return MaterialPageRoute(builder: (context) => const RecentScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
