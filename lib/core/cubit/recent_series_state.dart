part of 'recent_series_cubit.dart';

abstract class RecentSeriesState extends Equatable {
  const RecentSeriesState();

  @override
  List<Object> get props => [];
}

class RecentSeriesInitial extends RecentSeriesState {}

class RecentSeriesLoading extends RecentSeriesState {}

class RecentSeriesLoaded extends RecentSeriesState {
  final ResultSerie listOfSeries;

  const RecentSeriesLoaded({required this.listOfSeries});
}

class RecentSeriesError extends RecentSeriesState {
  final String message;

  const RecentSeriesError({required this.message});
}
