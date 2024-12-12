import 'package:granago_app/src/data/database_connection.dart';
import 'package:granago_app/src/data/scripts.dart';
import 'package:granago_app/src/models/gasto_model.dart';
import 'package:sqflite/sqflite.dart';

class GastoRepository {
  Database? _db;

  Future<void> insertGasto(GastoModel gasto) async {
    _db = await DatabaseConnection.getConnection();

    var sql = addGasto;
    await _db?.rawInsert(sql,
        [gasto.descricao, gasto.valorGasto, gasto.dataGasto.toIso8601String()]);
  }
}
