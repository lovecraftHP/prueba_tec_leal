import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/movie_exception.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';

part 'movie_recommendation_state.dart';

class MovieRecommendationtCubit extends Cubit<MovieRecommendationState> {
  final MovieRepository api;
  int _idMovie = 0;
  set idMovie(int value) => _idMovie = value;
  int get idMovie => _idMovie;

  MovieRecommendationtCubit({required this.api})
      : super(MovieRecommendationInitial()) {
    getRecommendations();
  }

  void getRecommendations() async {
    emit(MovieRecommendationLoading());
    try {
      var res = await api.getRecommendationsMovies(_idMovie);
      emit(MovieRecommendationLoaded(listOfRecommendations: res));
    } on MovieException catch (e) {
      emit(MovieRecommendationError(message: e.message));
    }
  }
}
