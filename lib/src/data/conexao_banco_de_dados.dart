import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Database? bancoDeDados;
  final String _nomeBancoDeDados = "GranaGo-App.db";

  // Instância única da classe (Singleton)
  static final DatabaseConnection _instancia = DatabaseConnection._internal();

  // Construtor privado para evitar a criação de novas instâncias
  DatabaseConnection._internal();

  // Factory que retorna a instância única
  factory DatabaseConnection() {
    return _instancia;
  }

  Future abrirConexaoComOBanco() async {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();

    Directory diretorioDeDocumentos = await getApplicationDocumentsDirectory();
    String caminhoBancoDeDados = join(diretorioDeDocumentos.path, _nomeBancoDeDados);
    bancoDeDados = await openDatabase(
      caminhoBancoDeDados,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 2,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE gastos(id INTEGER PRIMARY KEY, descricao TEXT, valor REAL, data TEXT)',
        );
      }
    );
  }
}