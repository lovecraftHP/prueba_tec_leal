import 'package:dio/dio.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/movie_exception.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';
import 'package:prueba_tec_leal/core/models/movie_detail_model.dart';

class MoviesApi implements MovieRepository {
  final _urlBase = "https://api.themoviedb.org/3/movie";
  final _apiKey = "7232404feac8c4f777411471eff682ad";
  @override
  Future<MovieDetailModel> getDetailsMovies(int id) async {
    try {
      var res = await Dio().post(
          "$_urlBase/$id/recommendations?api_key=$_apiKey&language=en-US&page=1");
      return MovieDetailModel.fromJson(res.data);
    } catch (e) {
      throw MovieException(
          message: 'Ocurrio un error al obtener los datos, Detail Movies.');
    }
  }

  @override
  Future<ResultModel> getPopularMovies() async {
    try {
      var res = await Dio()
          .post("$_urlBase/popular?api_key=$_apiKey&language=en-US&page=1");
      // var decodedData = jsonDecode(res.data);
      return ResultModel.fromJson(res.data);
    } catch (e) {
      throw MovieException(
          message: 'Ocurrio un error al obtener los datos, Popular Movies.');
    }
  }

  @override
  Future<ResultModel> getRecommendationsMovies(int id) async {
    try {
      var res = await Dio()
          .post("$_urlBase/upcoming?api_key=$_apiKey&language=en-US&page=1");
      return ResultModel.fromJson(res.data);
    } catch (e) {
      throw MovieException(
          message:
              'Ocurrio un error al obtener los datos, Recommendations Movies.');
    }
  }
}
