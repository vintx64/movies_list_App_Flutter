import 'package:flutter/cupertino.dart';
import 'package:movies_list_task/views/repo/movies/imovies_repo.dart';
import 'package:movies_list_task/views/repo/movies/cache/movies_cache_repo.dart';
import 'package:movies_list_task/views/repo/movies/remote/movies_remote_repo.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../services/hive_service.dart';

class MoviesRepo extends BaseViewModel {
  final ImoviesRepo _cacheRepo = MoviesCacheRepo();
  final ImoviesRepo _remoteRepo = MoviesRemoteRepo();
  final HiveService hiveService = HiveService();

  List<dynamic> movieList = [];
  getData() async {
    bool exists = await hiveService.isExists(boxName: kMovieBox);
    if (exists) {
      setBusy(true);
      movieList = await _cacheRepo.getSavedMovies();

      debugPrint('reading from cache');

      setBusy(false);
    } else {
      setBusy(true);

      await _remoteRepo.getMoviesFromApi(movieList);
      await _cacheRepo.saveMovies(movieList);
      debugPrint('reading from API');

      setBusy(false);
    }
  }
}
