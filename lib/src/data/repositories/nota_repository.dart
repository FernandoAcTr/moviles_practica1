import 'package:practica2/src/domain/contracts/I_db_repository.dart';
import 'package:practica2/src/domain/models/nota.dart';

class NotaService extends AbtractDBRepository {
  Future<int> insert(Map<String, dynamic> row) async {
    final con = await database;
    return con!.insert(dbHelper.notasTable, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    final con = await database;
    return con!.update(dbHelper.notasTable, row, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> delete(int id) async {
    final con = await database;
    return con!.delete(dbHelper.notasTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Nota>> findAll() async {
    final con = await database;
    final result = await con!.query(dbHelper.notasTable);
    return result.map<Nota>((mapa) => Nota.fromMap(mapa)).toList();
  }

  Future<Nota> findOne(int id) async {
    final con = await database;
    final result = await con!.query(dbHelper.notasTable, where: 'id = ?', whereArgs: [id]);

    return Nota.fromMap(result.first);
  }
}
