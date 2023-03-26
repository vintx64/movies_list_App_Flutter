import 'package:movies_list_task/src/models/movie_model.dart';
import 'package:movies_list_task/src/providers/movie_api_provider.dart';
import 'package:movies_list_task/src/repo/movies_repo/imovies_repo.dart';

class MoviesRemoteRepo extends ImoviesRepo {
  @override
  getMoviesFromApi() async {
    final MovieApiProvider apiProvider = MovieApiProvider();
    return await apiProvider.getAllMoviesFromApi();
  }

  @override
  getSavedMovies() {
    throw UnsupportedError('can not getSavedMovies in remote');
  }
}
