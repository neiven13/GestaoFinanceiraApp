import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:granago_app/src/data/scripts.dart';

class ConexaoBancoDeDados {
  Database? bancoDeDados;
  final String _nomeBancoDeDados = "GranaGo-App";

  // Instância única da classe (Singleton)
  static final ConexaoBancoDeDados _instancia = ConexaoBancoDeDados._internal();

  // Construtor privado para evitar a criação de novas instâncias
  ConexaoBancoDeDados._internal();

  // Factory que retorna a instância única
  factory ConexaoBancoDeDados() {
    return _instancia;
  }

  Future abrirConexaoComOBanco() async {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();

    if (bancoDeDados == null) {
      String databasePath = join(await getDatabasesPath(), _nomeBancoDeDados);
      bancoDeDados = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(criarTabelaGastos);
        },
      );
    }
  }
}