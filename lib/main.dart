import 'package:flutter/material.dart';
import 'package:granago_app/app_widget.dart';
import 'package:granago_app/src/data/conexao_banco_de_dados.dart';

void main() async {
  ConexaoBancoDeDados conexaoBancoDeDados = ConexaoBancoDeDados();
  await conexaoBancoDeDados.abrirConexaoComOBanco();
  runApp(const AppWidget());
}