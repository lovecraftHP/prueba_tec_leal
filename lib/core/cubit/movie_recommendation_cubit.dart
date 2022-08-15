import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';

part 'movie_recommendation_state.dart';

class MovieRecentCubit extends Cubit<MovieRecentState> {
  final MovieRepository api;
  MovieRecentCubit({required this.api}) : super(MovieRecentInitial());
}
