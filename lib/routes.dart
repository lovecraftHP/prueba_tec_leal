import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/ui/screens/detail_screen/detail_screen.dart';
import 'package:prueba_tec_leal/ui/screens/favorite_screen.dart';
import 'package:prueba_tec_leal/ui/screens/home_screen.dart';
import 'package:prueba_tec_leal/ui/screens/sign_in/login_screen.dart';
import 'package:prueba_tec_leal/ui/screens/popular_screen.dart';
import 'package:prueba_tec_leal/ui/screens/recent_screen.dart';
import 'package:prueba_tec_leal/ui/screens/spalsh_screen.dart';
import 'package:prueba_tec_leal/ui/screens/watch_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (context) => const SpalshScreen());
      case 'login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case 'details':
        return MaterialPageRoute(builder: (context) => const DetailScreen());
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
