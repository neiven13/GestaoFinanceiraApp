import 'package:granago_app/src/data/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class GastoRepository {
  void deletar(int id) async {
    final Database bancoDeDados = await DatabaseConnection().bancoDeDados;
    await bancoDeDados.delete(
      'gastos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
