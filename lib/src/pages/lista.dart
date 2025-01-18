import 'package:flutter/material.dart';
import 'package:granago_app/src/controllers/gasto_controller.dart';
import 'package:granago_app/src/models/gasto_model.dart';
import 'package:intl/intl.dart';
import 'package:granago_app/src/pages/addgasto_page.dart';
import 'package:granago_app/src/pages/deletar_gasto.dart';

import 'editar_gasto.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<GastoModel> gastos = List.empty();

@override
  void initState() {
    super.initState();
    obterGastos();
  }

  Future<void> obterGastos() async {
    gastos = await GastoController().obterTodos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gastos",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'shrikhand',
            fontSize: 25
          ),
        ),
      backgroundColor: const Color.fromARGB(255, 97, 176, 143),
      ),
      body: criarLista(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 97, 176, 143),
        shape: const CircleBorder(),
        onPressed: () async {
          const indicadorObterGastos = "obterGastos";
          final resultado = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddGastoPage()));
          if(resultado != null && resultado == indicadorObterGastos) {
            obterGastos();
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  Widget criarLista() {
    DateFormat formatoData = DateFormat('dd/MM/yyyy');

    if(gastos.isEmpty) {
      return const Center(child: Text('Sem gastos cadastrados'));
    }
    return ListView.builder(
      itemCount: gastos.length,
      padding: EdgeInsets.only(top: 7, bottom: 80),
      itemBuilder: (context, index) {
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            title: Text(
              gastos[index].descricao,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            subtitle: Row(
              children: <Widget>[
                Text(formatoData.format(DateTime.parse(gastos[index].data.toString().split(' ')[0]))),
              ],
            ),
            trailing: Container(
              width: 190,
              child: Row(
                children: [
                    Text(
                      estilizarValor(gastos[index].valor.toString()),
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Container()
                    ),
                    IconButton(
                      onPressed: () async {
                        final resultado = await Navigator.of(
                            context).push(MaterialPageRoute
                          (builder: (context) => EditGastoPage(gasto: gastos[index]))
                        );
                        if(resultado != null) {
                          obterGastos();
                        }
                      },
                        icon: const Icon(Icons.edit),
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          criarDialogoDeletar(gastos[index].id, gastos[index].descricao, gastos[index].valor);
                        },
                        icon: const Icon(Icons.delete),
                        iconSize: 20,
                      ),
                ]
              )
            )
          )
        );
     }
    );
  }

  String estilizarValor(String valor) {
    valor = valor.replaceAll(".", ",");
    var valores = valor.split(",");
    if(valores.length == 2 && valores[1].length == 1) {
      valores[1] += "0";
      valor = "";
      valor += valores[0] + "," + valores[1];
    }
    return 'R\$${valor}';
  }

  void criarDialogoDeletar(int? id, String descricao, double valor) async {
    if(id != null) {
      const String indicadorObterGastos = "obterGastos";
      final resultado = await showDialog(
        context: context,
        builder: (context) => DeletarGasto(
              descricao: descricao,
              id: id,
              valor: valor,
            ));
      if(resultado != null && resultado == indicadorObterGastos) {
        obterGastos();
      }
    }
  }
}