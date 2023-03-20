import 'package:movies_list_task/models/movie_model.dart';

class MovieResult {
  final int page;
  final List<MovieModel> results;

  MovieResult(this.page, this.results);
}
