import 'package:flutter/material.dart';
import 'package:granago_app/src/pages/edit_page.dart';  // Certifique-se de que a importação está correta
import 'package:granago_app/src/pages/addgasto_page.dart';
import 'package:granago_app/src/models/gasto_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GastoModel> _gastos = [
    GastoModel(1, 'Gasto 1', DateTime.now(), 100.0),
    GastoModel(2, 'Gasto 2', DateTime.now(), 200.0),
    // Adicione mais itens conforme necessário
  ];

  void _updateGasto(GastoModel updatedGasto) {
    setState(() {
      final index = _gastos.indexWhere((gasto) => gasto.id == updatedGasto.id);
      if (index != -1) {
        _gastos[index] = updatedGasto; // Atualiza o gasto na lista
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        itemCount: _gastos.length,
        itemBuilder: (context, index) {
          final gasto = _gastos[index];
          return ListTile(
            title: Text(gasto.descricao),
            subtitle: Text('R\$ ${gasto.valorGasto}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                // Navegar para a página de edição, passando o gasto atual
                final updatedGasto = await Navigator.push<GastoModel>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditGastoPage(gasto: gasto),
                  ),
                );
                if (updatedGasto != null) {
                  // Se o gasto foi editado, atualiza a lista
                  _updateGasto(updatedGasto);
                }
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Row(
        children: [
          IconButton(
            onPressed: () {
              // Navegar para a página de adicionar gasto
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddGastoPage(),
              ));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
