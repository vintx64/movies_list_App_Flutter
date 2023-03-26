import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/movie_model.dart';
import 'db_provider.dart';

class MovieApiProvider {
  Future<dynamic> getAllMoviesFromApi() async {
    var url = kUrl;
    Response response = await Dio().get(url);
    List<dynamic> resDynamic = response.data['results'];
    return resDynamic.map((movie) {
      // print('Inserting $movie');
      DBProvider.db.createMovie(MovieModel.fromJson(movie));
    }).toList();
  }
}
