import 'package:movies_list_task/constants.dart';
import 'package:movies_list_task/models/movie_model.dart';

import '../helper/api.dart';

class GetMoviesList {
  Future<List<MovieModel>> getMoviesList() async {
    List<dynamic> data = await Api().get(url: kUrl);
    List<MovieModel> movieList = [];
    for (int i = 0; i < data.length; i++) {
      movieList.add(
        MovieModel.fromJson(data[i]),
      );
    }
    print(movieList);
    return movieList;
  }
}
