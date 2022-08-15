import 'package:prueba_tec_leal/core/models/serie_model.dart';

class ResultSerie {
  int? page;
  List<SeriesModel>? results;
  int? totalPages;
  int? totalResults;

  ResultSerie({this.page, this.results, this.totalPages, this.totalResults});

  ResultSerie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SeriesModel>[];
      json['results'].forEach((v) {
        results!.add(SeriesModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
