part of 'movies_popular_cubit.dart';

abstract class MoviesPopularState extends Equatable {
  const MoviesPopularState();

  @override
  List<Object> get props => [];
}

class MoviesPopularInitial extends MoviesPopularState {}

class MoviesPopularLoaded extends MoviesPopularState {
  final ResultModel listOfMovies;

  const MoviesPopularLoaded({required this.listOfMovies});
}

class MoviesPopularLoading extends MoviesPopularState {}

class MoviesPopularError extends MoviesPopularState {
  final String message;

  const MoviesPopularError({required this.message});
}
