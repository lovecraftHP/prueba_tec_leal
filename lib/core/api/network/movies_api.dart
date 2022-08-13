import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';
import 'package:prueba_tec_leal/core/models/movie_detail_model.dart';

class MoviesApi implements MovieRepository {
  @override
  Future<MovieDetailModel> getDEtailsMovies() {
    // TODO: implement getDEtailsMovies
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> getRecentMovies() {
    // TODO: implement getRecentMovies
    throw UnimplementedError();
  }
}
