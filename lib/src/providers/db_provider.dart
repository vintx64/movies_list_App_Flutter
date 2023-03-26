import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:movies_list_task/src/providers/movie_api_provider.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/movie_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'movies_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Movies('
          'id INTEGER PRIMARY KEY,'
          'title TEXT,'
          'release_date TEXT ,'
          'vote_average TEXT ,'
          'poster_path TEXT '
          ')');
    });
  }

  // Insert movies on database
  createMovie(Movie newMovie) async {
    final db = await database;
    final res = await db.insert('movies', newMovie.toJson());

    return res;
  }

  Future<List<Movie>> getAllMovies() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM movies");

    List<Movie> list;
    if (res.isEmpty) {
      debugPrint('read from Api then add to cache');
      var apiProvider = MovieApiProvider();

      await apiProvider.getAllMovies();
      await Future.delayed(const Duration(seconds: 2));
      list = res.map((c) => Movie.fromJson(c)).toList();
    } else {
      debugPrint('read from cache');
      list = res.map((c) => Movie.fromJson(c)).toList();
    }

    return list;
  }
}
