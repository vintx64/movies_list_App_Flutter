import 'package:flutter/cupertino.dart';
import 'package:movies_list_task/constants.dart';
import 'package:movies_list_task/models/movie_model.dart';
import 'package:stacked/stacked.dart';

import '../../services/api_service.dart';
import '../../services/hive_service.dart';

class HomeViewModel extends BaseViewModel {
  final HiveService hiveService = HiveService();
  final ApiService apiService = ApiService();
  List<dynamic> _movieList = [];
  List<dynamic> get movieList => _movieList;
  String _text = "";
  String get text => _text;
  getData() async {
    debugPrint("Entered get Data()");
    _text = "Fetching data";
    bool exists = await hiveService.isExists(boxName: kMovieBox);
    if (exists) {
      _text = "Fetching from hive";
      debugPrint("Getting data from Hive");
      setBusy(true);
      _movieList = await hiveService.getBoxes(kMovieBox);
      setBusy(false);
    } else {
      _text = "Fetching from hive";
      debugPrint("Getting data from Api");
      setBusy(true);
      dynamic result = await apiService.get(url: kUrl, token: null);
      List<dynamic> resDynamic = result['results'];
      resDynamic.map((e) {
        MovieModel movie = MovieModel(
            movieName: e['title'],
            movieYear: e['release_date'],
            movieRate: e['vote_average'],
            image: e['poster_path']);
        _movieList.add(movie);
      }).toList();
      _text = "Caching data";
      await hiveService.addBoxes(_movieList, kMovieBox);
      setBusy(false);
    }
  }

  Future<List<MovieModel>> getMoviesFromApi() async {
    dynamic data = await ApiService().get(url: kUrl, token: null);
    List<dynamic> resDynamic = data['results'];
    List<MovieModel> movieList = [];
    for (int i = 0; i < resDynamic.length; i++) {
      movieList.add(
        MovieModel.fromJson(resDynamic[i]),
      );
    }

    return movieList;
  }
}
