import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 23,
          ),
          title: MovieName(),
          subtitle: MovieYear(),
          trailing: MovieRate(),
        ),
        Divider(
          color: Colors.grey,
          indent: 80,
          thickness: .3,
          height: 1,
        )
      ],
    );
  }
}

class MovieRate extends StatelessWidget {
  const MovieRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: const Center(
                  child: Text(
                '8.3',
                style: TextStyle(
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
    );
  }
}

class MovieYear extends StatelessWidget {
  const MovieYear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 7, bottom: 5),
      child: Text(
        '2021',
      ),
    );
  }
}

class MovieName extends StatelessWidget {
  const MovieName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text('Spider-Man: No Way Home'),
    );
  }
}
