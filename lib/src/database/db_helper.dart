import 'dart:io';

import 'package:practica2/src/models/nota_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _nameDB = "NOTASDB";
  static final _versionDB = 1;
  static final _nameTable = 'notas';

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _nameDB);

    return openDatabase(path, version: _versionDB, onCreate: _createTable);
  }

  _createTable(Database db, int version) async {
    final sql = "CREATE TABLE $_nameTable (id INTEGER PRIMARY KEY, titulo VARCHAR(50), detalle VARCHAR(100))";
    await db.execute(sql);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final con = await database;
    return con!.insert(_nameTable, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    final con = await database;
    return con!.update(_nameTable, row, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> delete(int id) async {
    final con = await database;
    return con!.delete(_nameTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Nota>> getAllNotes() async {
    final con = await database;
    final result = await con!.query(_nameTable);
    return result.map<Nota>((mapa) => Nota.fromMap(mapa)).toList();
  }

  Future<Nota> getOneNote(int id) async {
    final con = await database;
    final result = await con!.query(_nameTable, where: 'id = ?', whereArgs: [id]);

    return Nota.fromMap(result.first);
  }
}
