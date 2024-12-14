import 'package:granago_app/src/data/database_connection.dart';
import 'package:granago_app/src/data/services/gasto_repository.dart';
import 'package:sqflite/sqflite.dart';

class GastoController {
  void deletar(int id) async {
    GastoRepository().deletar(id);
  }
}
