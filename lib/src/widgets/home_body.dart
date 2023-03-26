import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../providers/db_provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBProvider.db.getAllMovies(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? circularIndicator()
              : checkState(snapshot);
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

  ListView buildListView(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}'),
                  radius: 23,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(snapshot.data![index].title.toString()),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 5),
                  child: Text(
                    snapshot.data![index].releaseDate
                        .toString()
                        .substring(0, 4),
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
                            snapshot.data![index].voteAverage
                                .toString()
                                .substring(0, 3),
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
        });
  }

  checkState(AsyncSnapshot<List<Movie>> snapshot) {
    if (snapshot.hasData) {
      return buildListView(snapshot);
    } else {
      return circularIndicator();
    }
  }
}
