import 'package:hive_flutter/hive_flutter.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final dynamic id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String movieName;
  @HiveField(3)
  final dynamic movieYear;
  @HiveField(4)
  final dynamic movieRate;

  MovieModel(
      {required this.movieName,
      required this.movieYear,
      required this.movieRate,
      this.id,
      required this.image});
  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
        movieName: jsonData['title'],
        movieYear: jsonData['release_date'],
        movieRate: jsonData['vote_average'],
        image: jsonData['poster_path']);
  }
}
