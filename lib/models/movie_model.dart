import 'package:hive_flutter/hive_flutter.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final String movieName;
  @HiveField(1)
  final int movieYear;
  @HiveField(2)
  final double movieRate;

  MovieModel(this.movieName, this.movieYear, this.movieRate);
}
