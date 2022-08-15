import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/movie_exception.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';

part 'movies_popular_state.dart';

class MoviesPopularCubit extends Cubit<MoviesPopularState> {
  final MovieRepository api;
  late int _idMovie;
  late int _index;

  int get idMovie => _idMovie;
  set idMovie(value) => _idMovie = value;

  int get index => _index;
  set index(value) => _index = value;

  MoviesPopularCubit({required this.api}) : super(MoviesPopularInitial()) {
    getPopularMovies();
  }

  void getPopularMovies() async {
    emit(MoviesPopularLoading());
    try {
      api.getPopularMovies().then((value) {
        emit(MoviesPopularLoaded(listOfMovies: value));
        _idMovie = value.results!.first.id!;
      });
    } on MovieException catch (e) {
      emit(MoviesPopularError(message: e.message));
    }
  }
}
