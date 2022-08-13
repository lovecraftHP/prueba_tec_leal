class BelongToCollectionModel {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongToCollectionModel(
      {this.id, this.name, this.posterPath, this.backdropPath});

  BelongToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    return data;
  }
}
