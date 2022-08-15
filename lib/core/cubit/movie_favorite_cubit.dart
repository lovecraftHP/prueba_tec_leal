import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_favorite_state.dart';

class MovieFavoriteCubit extends Cubit<MovieFavoriteState> {
  MovieFavoriteCubit() : super(MovieFavoriteInitial());
}
