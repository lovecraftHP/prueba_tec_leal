import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/exceptions/movie_exception.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';
import 'package:prueba_tec_leal/core/models/result_serie.dart';

part 'recent_series_state.dart';

class RecentSeriesCubit extends Cubit<RecentSeriesState> {
  final MovieRepository api;
  RecentSeriesCubit({required this.api}) : super(RecentSeriesInitial()) {
    getAllSeries();
  }

  void getAllSeries() async {
    emit(RecentSeriesLoading());
    try {
      await api
          .getRecentSerie()
          .then((value) => emit(RecentSeriesLoaded(listOfSeries: value)));
    } on MovieException catch (e) {
      emit(RecentSeriesError(message: e.message));
    }
  }
}
