import 'package:prueba_tec_leal/core/models/result_model.dart';

abstract class MovieRepository {
  Future<ResultModel> getPopularMovies();
  Future<ResultModel> getRecentMovies();
  Future getDEtailsMovies();
}
