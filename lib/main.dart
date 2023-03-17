import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_list_task/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MoviesList());
}

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
