import 'package:flutter/material.dart';
import 'package:movies_list_task/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Movies')),
      body: const HomeBody(),
    );
  }
}
