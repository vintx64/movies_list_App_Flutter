import 'package:movies_list_task/src/models/movie_model.dart';

abstract class ImoviesRepo {
  getMoviesFromApi();
  getSavedMovies();
}
