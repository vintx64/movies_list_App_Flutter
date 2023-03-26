import 'package:flutter/cupertino.dart';
import 'package:movies_list_task/src/providers/db_provider.dart';
import 'package:movies_list_task/src/repo/movies_repo/remote/movies_remote_repo.dart';
import 'package:stacked/stacked.dart';
import 'cache/movies_cache_repo.dart';
import 'imovies_repo.dart';

class MoviesRepo extends BaseViewModel {
  final ImoviesRepo _cacheRepo = MoviesCacheRepo();
  final ImoviesRepo _remoteRepo = MoviesRemoteRepo();

  List<dynamic> movieList = [];
  getData() async {
    final db = await DBProvider.db.database;
    final res = await db.rawQuery("SELECT * FROM Movies");
    if (res.isEmpty) {
      debugPrint('reading from Api');
      setBusy(true);
      await _remoteRepo.getMoviesFromApi();
      debugPrint('taking data from Api and inserting it to cache');
      debugPrint('reading from cache');
      movieList = await _cacheRepo.getSavedMovies();
      setBusy(false);
    } else {
      debugPrint('reading from cache');
      setBusy(true);
      movieList = await _cacheRepo.getSavedMovies();
      setBusy(false);
    }
  }
}
