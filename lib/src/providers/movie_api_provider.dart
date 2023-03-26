import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/movie_model.dart';
import 'db_provider.dart';

class MovieApiProvider {
  Future<dynamic> getAllMovies() async {
    var url = kUrl;
    Response response = await Dio().get(url);
    List<dynamic> resDynamic = response.data['results'];
    return resDynamic.map((movie) {
      // print('Inserting $movie');

      DBProvider.db.createMovie(Movie.fromJson(movie));
    }).toList();
  }
}
