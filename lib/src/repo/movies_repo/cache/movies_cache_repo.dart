import 'package:movies_list_task/src/models/movie_model.dart';
import 'package:movies_list_task/src/providers/db_provider.dart';
import 'package:movies_list_task/src/repo/movies_repo/imovies_repo.dart';

class MoviesCacheRepo extends ImoviesRepo {
  @override
  getMoviesFromApi() {
    throw UnsupportedError('can not getMoviesFromApi in cache');
  }

  @override
  getSavedMovies() async {
    return await DBProvider.db.getAllMovies();
  }
}
