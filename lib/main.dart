import 'package:flutter/material.dart';
import 'package:movies_list_task/src/pages/home_view.dart';

void main() {
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
