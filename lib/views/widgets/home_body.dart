import 'package:flutter/material.dart';
import 'package:movies_list_task/views/viewmodel/home_view_model.dart';
import 'package:stacked/stacked.dart';

import 'movies_list_view.dart';

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
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) => model.getData(),
        builder: (context, model, child) {
          if (model.movieList.isNotEmpty) {
            return MoviesListView(
              model: model,
            );
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
