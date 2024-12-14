import 'package:flutter/material.dart';
import 'package:granago_app/src/controllers/gasto_controller.dart';
import 'package:granago_app/src/models/gasto_model.dart';
import 'package:intl/intl.dart';

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
        onPressed: () {},
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
          shape: ,
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
                      'R\$${gastos[index].valor.toString()}',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Expanded(
                      child: Container()
                    ),
                    IconButton(
                        onPressed: () {}, 
                        icon: const Icon(Icons.edit),
                        iconSize: 20,
                      ),
                      IconButton(
                        onPressed: () {},
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
}