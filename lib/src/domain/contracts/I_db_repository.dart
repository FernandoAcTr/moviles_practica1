import 'package:practica2/src/data/database/db_helper.dart';
import 'package:sqflite/sqflite.dart';

abstract class AbtractDBRepository {
  DBHelper dbHelper = DBHelper();
  Future<Database?> get database => dbHelper.database;

  Future<int> insert(Map<String, dynamic> row);
  Future<int> update(Map<String, dynamic> row);
  Future<int> delete(int id);
  Future<List<Object>> findAll();
  Future<Object> findOne(int id);
}
