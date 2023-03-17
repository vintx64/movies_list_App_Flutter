import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_list_task/cubit/movie_cubit.dart';
import 'package:movies_list_task/simple_bloc_observer.dart';
import 'package:movies_list_task/views/home_view.dart';

import 'constants.dart';
import 'models/movie_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>(kMovieBox);
  runApp(const MoviesList());
}

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
