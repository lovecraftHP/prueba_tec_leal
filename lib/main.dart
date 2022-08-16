import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba_tec_leal/core/api/network/login_api.dart';
import 'package:prueba_tec_leal/core/api/network/movies_api.dart';
import 'package:prueba_tec_leal/core/cubit/login_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/movie_favorite_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/movie_recommendation_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/movies_popular_cubit.dart';
import 'package:prueba_tec_leal/core/cubit/recent_series_cubit.dart';
import 'package:prueba_tec_leal/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(
                create: (context) => LoginCubit(loginRepository: LoginApi()),
              ),
              BlocProvider<MoviesPopularCubit>(
                  create: (context) => MoviesPopularCubit(api: MoviesApi())),
              BlocProvider<MovieFavoriteCubit>(
                  create: (context) => MovieFavoriteCubit()),
              BlocProvider<MovieRecommendationtCubit>(
                  create: (context) =>
                      MovieRecommendationtCubit(api: MoviesApi())),
              BlocProvider<RecentSeriesCubit>(
                  create: (context) => RecentSeriesCubit(api: MoviesApi()))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Quicksand',
                brightness: Brightness.dark,
              ),
              onGenerateRoute: Routes.onGenerateRoutes,
              initialRoute: 'login',
            ),
          ));
}
