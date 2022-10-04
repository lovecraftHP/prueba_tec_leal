import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_tec_leal/core/api/network/login_api.dart';
import 'package:prueba_tec_leal/core/api/network/movies_api.dart';
import 'package:prueba_tec_leal/core/api/repository/login_repository.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';

final l = GetIt.I;
final _dio = Dio();

void setUp() {
  l.registerLazySingleton<MovieRepository>(() => MoviesApi());
  l.registerLazySingleton<LoginRepository>(() => LoginApi());
}
