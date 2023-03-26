import 'package:flutter/material.dart';
import 'package:movies_list_task/src/constants.dart';
import 'package:movies_list_task/src/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(kImageBaseUrl + movie.posterPath),
            radius: 23,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(movie.title.toString()),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 5),
            child: Text(
              movie.releaseDate.toString().substring(0, 4),
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
                      movie.voteAverage.toString().substring(0, 3),
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
