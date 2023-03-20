import 'package:flutter/material.dart';
import 'package:movies_list_task/models/movie_model.dart';
import 'package:movies_list_task/services/api_service.dart';
import 'package:movies_list_task/views/widgets/movie_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieList();
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
        future: AllMoviesService().getAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> movies = snapshot.data!;

            return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                    movie: movies[index],
                  );
                });
          } else {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Checking Internet Connection'),
                  ]),
            );
          }
        });
  }
}
