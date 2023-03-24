import 'package:movies_list_task/constants.dart';
import 'package:movies_list_task/services/api_service.dart';
import 'package:movies_list_task/views/repo/movies/imovies_repo.dart';

import '../../../../models/movie_model.dart';

class MoviesRemoteRepo extends ImoviesRepo {
  final ApiService apiService = ApiService();

  @override
  getMoviesFromApi(List<dynamic> movieList) async {
    dynamic result = await apiService.get(url: kUrl, token: null);
    List<dynamic> resDynamic = result['results'];
    resDynamic.map((e) {
      MovieModel movie = MovieModel(
          movieName: e['title'],
          movieYear: e['release_date'],
          movieRate: e['vote_average'],
          image: e['poster_path']);
      movieList.add(movie);
    }).toList();
  }

  @override
  getSavedMovies() {
    throw UnsupportedError('can not getSavedMovies in remote');
  }

  @override
  saveMovies(List<dynamic> movies) {
    throw UnsupportedError('can not saveMovies in remote');
  }
}
