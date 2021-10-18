import 'package:practica2/src/data/contracts/I_db_repository.dart';
import 'package:practica2/src/data/database/db_helper.dart';
import 'package:practica2/src/data/models/movie.dart';
import 'package:sqflite/sqflite.dart';

class MovieRepository extends AbstractDBRepository {
  final DBHelper dbHelper;

  MovieRepository(this.dbHelper);

  Future<Database?> get database => dbHelper.database;

  @override
  Future<int> delete(int id) async {
    final con = await database;
    return con!.delete(dbHelper.moviesTable, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<Movie>> findAll() async {
    final con = await database;
    final result = await con!.query(dbHelper.moviesTable);
    return result.map<Movie>((map) => Movie.fromMap(map)).toList();
  }

  @override
  Future<Movie?> findOne(int id) async {
    final con = await database;
    final result = await con!.query(dbHelper.moviesTable, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Movie.fromMap(result.first) : null;
  }

  @override
  Future<int> insert(Map<String, dynamic> row) async {
    final con = await database;
    return con!.insert(dbHelper.moviesTable, row);
  }

  @override
  Future<int> update(Map<String, dynamic> row) {
    throw UnimplementedError();
  }

  void toggleFovourite(Movie movie) async {
    final _movie = await this.findOne(movie.id!);
    if (_movie != null)
      delete(_movie.id!);
    else
      insert(movie.toMap());
  }

  Future<bool> isFavourite(int id) async {
    final movie = await this.findOne(id);
    return movie != null;
  }
}
