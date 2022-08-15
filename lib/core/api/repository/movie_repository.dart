import 'package:prueba_tec_leal/core/models/movie_detail_model.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';

abstract class MovieRepository {
  Future<ResultModel> getPopularMovies();
  Future<ResultModel> getRecommendationsMovies(int id);
  Future<MovieDetailModel> getDetailsMovies(int id);
}
