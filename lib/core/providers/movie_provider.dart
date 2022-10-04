import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tec_leal/core/api/repository/movie_repository.dart';
import 'package:prueba_tec_leal/core/models/movie_model.dart';
import 'package:prueba_tec_leal/core/models/result_model.dart';
import 'package:prueba_tec_leal/locator.dart';

class MovieProvider extends ChangeNotifier {
  final _api = l.get<MovieRepository>();
  int? _idMovie;
  int _index = 0;
  ResultModel? _listOfPopularMovies;
  MovieModel? _selectedMovie;

  ResultModel? get listOfPopularMovies => _listOfPopularMovies;
  MovieModel? get selectedMovie => _selectedMovie;

  int? get idMovie => _idMovie;
  set idMovie(int? value) {
    _idMovie = value;
    notifyListeners();
  }

  int get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }

  Future<ResultModel> getPopularMovies() async {
    try {
      _listOfPopularMovies = await _api.getPopularMovies();
      _idMovie = _listOfPopularMovies?.results?.first.id;
    } catch (e) {
      rethrow;
    }
    return _listOfPopularMovies!;
  }

  void movieToBooking(int index) {
    _selectedMovie = _listOfPopularMovies?.results?[index];
    notifyListeners();
  }
}

final movieProvider =
    ChangeNotifierProvider<MovieProvider>((ref) => MovieProvider());
final movieData = FutureProvider(
    (ref) async => await ref.watch(movieProvider).getPopularMovies());
