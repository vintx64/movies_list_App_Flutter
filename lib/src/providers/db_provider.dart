import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/movie_model.dart';
import 'package:path/path.dart' as p;

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, 'movies_manager.db');

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
  createMovie(MovieModel newMovie) async {
    final db = await database;
    final res = await db.insert('Movies', newMovie.toJson());

    return res;
  }

  Future<List<MovieModel>> getAllMovies() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Movies");
    List<MovieModel> list =
        res.isNotEmpty ? res.map((c) => MovieModel.fromJson(c)).toList() : [];
    return list;
  }
}
