import 'dart:convert';

List<Movie> moviesFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String moviesToJson(List<Movie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  final int id;
  final String title;

  final String releaseDate;
  final dynamic voteAverage;
  final String posterPath;
  Movie(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.posterPath});
  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(
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
