import 'package:flutter/material.dart';

import '../../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  MovieItem({
    super.key,
    required this.movie,
  });
  MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(movie.image),
            radius: 23,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(movie.movieName),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 5),
            child: Text(
              movie.movieYear.toString().substring(0, 4),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 22,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                    ),
                    child: Center(
                        child: Text(
                      movie.movieRate.toString().substring(0, 3),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.withOpacity(.5),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          indent: 80,
          thickness: .3,
          height: 1,
        )
      ],
    );
  }
}
