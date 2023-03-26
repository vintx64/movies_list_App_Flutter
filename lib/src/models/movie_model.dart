import 'dart:convert';

List<MovieModel> moviesFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String moviesToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  final int id;
  final String title;

  final String releaseDate;
  final dynamic voteAverage;
  final String posterPath;
  MovieModel(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.posterPath});
  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
        id: jsonData['id'],
        title: jsonData['title'],
        releaseDate: jsonData['release_date'],
        voteAverage: jsonData['vote_average'],
        posterPath: jsonData['poster_path']);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "release_date": releaseDate,
        "vote_average": voteAverage,
        "poster_path": posterPath,
      };
}
