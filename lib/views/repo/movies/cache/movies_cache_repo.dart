import 'package:movies_list_task/constants.dart';
import 'package:movies_list_task/views/repo/movies/imovies_repo.dart';

import '../../../../services/hive_service.dart';

class MoviesCacheRepo extends ImoviesRepo {
  final HiveService hiveService = HiveService();

  @override
  getMoviesFromApi(List<dynamic> movieList) {
    throw UnsupportedError('can not getMoviesFromApi in cache');
  }

  @override
  getSavedMovies() async {
    return await hiveService.getBoxes(kMovieBox);
  }

  @override
  saveMovies(List<dynamic> movies) async {
    await hiveService.addBoxes(movies, kMovieBox);
  }
}
