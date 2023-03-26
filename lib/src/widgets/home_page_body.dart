import 'package:flutter/material.dart';
import 'package:movies_list_task/src/repo/movies_repo/movies_repo.dart';
import 'package:movies_list_task/src/widgets/movie_item.dart';
import 'package:stacked/stacked.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, this.model});
  final MoviesRepo? model;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesRepo>.reactive(
        viewModelBuilder: () => MoviesRepo(),
        onViewModelReady: (model) => model.getData(),
        builder: (context, model, child) {
          return model.movieList.isNotEmpty
              ? buildListView(model)
              : circularIndicator();
        });
  }

  Center circularIndicator() {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        Text('Checking Internet Connection'),
      ]),
    );
  }

  ListView buildListView(MoviesRepo model) {
    return ListView.builder(
        itemCount: model.movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(
            movie: model.movieList[index],
          );
        });
  }
}
