import 'package:flutter/material.dart';
import 'package:granago_app/src/pages/deletar_gasto.dart';

class TesteHome extends StatelessWidget {
  const TesteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('teste'),
      ),
      body: IconButton(
          onPressed: () {
            int id = 2;
            double valor = 2.2;
            String descricao = 'teste';
            showDialog(
                context: context,
                builder: (context) => DeletarGasto(
                      descricao: descricao,
                      id: id,
                      valor: valor,
                    ));
          },
          icon: Icon(Icons.delete)),
    );
  }
}
