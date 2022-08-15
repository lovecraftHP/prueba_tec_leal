part of 'movie_recommendation_cubit.dart';

abstract class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();

  @override
  List<Object> get props => [];
}

class MovieRecommendationInitial extends MovieRecommendationState {}

class MovieRecommendationLoading extends MovieRecommendationState {}

class MovieRecommendationLoaded extends MovieRecommendationState {
  final ResultModel listOfRecommendations;

  const MovieRecommendationLoaded({required this.listOfRecommendations});
}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  const MovieRecommendationError({required this.message});
}
