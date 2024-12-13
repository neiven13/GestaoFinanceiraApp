import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:granago_app/src/models/gasto_model.dart';
import 'package:granago_app/src/models/valor_gasto_formatter.dart';
import 'package:granago_app/src/pages/home_page.dart';

class EditGastoPage extends StatefulWidget {
  final GastoModel gasto; // Gasto que será editado

  const EditGastoPage({super.key, required this.gasto});

  @override
  State<EditGastoPage> createState() => _EditGastoPageState();
}

class _EditGastoPageState extends State<EditGastoPage> {
  late TextEditingController _valorController;
  late TextEditingController _descricaoController;
  late int selectedIndex;
  late DateTime gastoDate;

  final Color corPrincipal = const Color.fromRGBO(79, 125, 106, 1);

  @override
  void initState() {
    super.initState();
    // Inicializar controladores com os dados do gasto
    _valorController = TextEditingController(
        text: widget.gasto.valorGasto.toStringAsFixed(2).replaceAll('.', ','));
    _descricaoController = TextEditingController(text: widget.gasto.descricao);
    gastoDate = widget.gasto.dataGasto;
    selectedIndex = _determineSelectedIndex();
  }

  int _determineSelectedIndex() {
    final now = DateTime.now();
    if (gastoDate.year == now.year &&
        gastoDate.month == now.month &&
        gastoDate.day == now.day) {
      return 0; // Hoje
    } else if (gastoDate.year == now.year &&
        gastoDate.month == now.month &&
        gastoDate.day == now.subtract(const Duration(days: 1)).day) {
      return 1; // Ontem
    }
    return 2; // Outra data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Despesa"),
        backgroundColor: corPrincipal,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "R\$",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(75, 74, 74, 1)),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: _valorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintStyle: TextStyle(fontSize: 32)),
                    style: const TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(75, 74, 74, 1),
                        fontWeight: FontWeight.bold),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ValorGastoFormatter()
                    ],
                  ),
                ),
                const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(79, 125, 106, 1),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 82, 82, 82)),
                    borderRadius: BorderRadius.circular(20)),
                labelText: "Descrição",
                labelStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 67, 67, 67)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedIndex == 0 ? corPrincipal : Colors.grey[300],
                    foregroundColor:
                    selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      gastoDate = DateTime.now();
                      selectedIndex = 0;
                    });
                  },
                  child: const Text("Hoje"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedIndex == 1 ? corPrincipal : Colors.grey[300],
                    foregroundColor:
                    selectedIndex == 1 ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      gastoDate = DateTime.now().subtract(const Duration(days: 1));
                      selectedIndex = 1;
                    });
                  },
                  child: const Text("Ontem"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedIndex == 2 ? corPrincipal : Colors.grey[300],
                    foregroundColor:
                    selectedIndex == 2 ? Colors.white : Colors.black,
                  ),
                  onPressed: () async {
                    final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: gastoDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        gastoDate = selectedDate;
                        selectedIndex = 2;
                      });
                    }
                  },
                  child: Text(selectedIndex == 2
                      ? "${gastoDate.day} / ${gastoDate.month} / ${gastoDate.year}"
                      : "Escolher Data"),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                foregroundColor: Colors.white,
                backgroundColor:
                const Color.fromRGBO(232, 232, 232, 1), // Cor do texto
              ),
              child: const Text(
                "Cancelar",
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Atualizar o gasto
                widget.gasto.descricao = _descricaoController.text;
                widget.gasto.valorGasto = double.parse(
                    _valorController.text.replaceAll(',', '.'));
                widget.gasto.dataGasto = gastoDate;

                Navigator.of(context).pop(widget.gasto);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
                foregroundColor: Colors.white,
                backgroundColor: corPrincipal, // Usando a cor principal aqui
              ),
              child: const Text("Salvar Alteração"),
            )
          ],
        ),
      ),
    );
  }
}
