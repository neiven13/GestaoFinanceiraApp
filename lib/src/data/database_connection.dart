import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  static Database? _database;

  static Future<Database> getConnection() async {
    if (_database == null) {
      String databasePath = join(await getDatabasesPath(), 'gastos_database');
      _database = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (db, version) => {
          db.execute('') //script sql aqui
        },
        );
    }
    return _database!;
  }
}
