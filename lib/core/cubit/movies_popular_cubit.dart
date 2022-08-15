import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/movie_exception.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';

part 'movies_popular_state.dart';

class MoviesPopularCubit extends Cubit<MoviesPopularState> {
  final MovieRepository api;
  MoviesPopularCubit({required this.api}) : super(MoviesPopularInitial()) {
    getPopularMovies();
  }

  void getPopularMovies() async {
    emit(MoviesPopularLoading());
    try {
      var res = await api.getPopularMovies();

      emit(MoviesPopularLoaded(listOfMovies: res));
    } on MovieException catch (e) {
      emit(MoviesPopularError(message: e.message));
    }
  }
}
