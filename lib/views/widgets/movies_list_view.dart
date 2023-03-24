import 'package:flutter/material.dart';

import '../repo/movies/movies_repo.dart';
import 'movie_item.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({
    super.key,
    required this.model,
  });
  final MoviesRepo model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.movieList.length,
        itemBuilder: (context, index) {
          return MovieItem(
            movie: model.movieList[index],
          );
        });
  }
}
