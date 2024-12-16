import 'package:flutter/material.dart';
import 'package:granago_app/src/controllers/gasto_controller.dart';

class DeletarGasto extends StatelessWidget {
  final int id;
  final double valor;
  final String descricao;
  const DeletarGasto(
      {super.key,
      required this.id,
      required this.valor,
      required this.descricao});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Deseja excluir o gasto R\$ $valor de $descricao?',
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      actions: [
        // Botão Cancelar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromRGBO(232, 232, 232, 1), // Cor do texto
              ),
              child: const Text(
                "Não",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            // Botão Confirmar
            ElevatedButton(
              onPressed: () {
                const indicadorObterGastos = "obterGastos";
                GastoController().deletar(id);
                Navigator.of(context).pop(indicadorObterGastos); // Fecha o diálogo após a exclusão
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item excluído com sucesso!')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromARGB(255, 97, 176, 143) // Cor principal
              ),
              child: const Text("Sim"),
            ),
          ],
        )
      ],
    );
  }
}
