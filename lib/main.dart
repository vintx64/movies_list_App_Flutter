import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_list_task/views/home_view.dart';

import 'models/movie_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());

  runApp(const MoviesList());
}

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
