import 'package:granago_app/src/data/services/gasto_repositorio.dart';
import 'package:granago_app/src/models/gasto_model.dart';

class GastoController {
  final GastoRepositorio _repositorio = GastoRepositorio();

  void deletar(int id) async {
    _repositorio.deletar(id);
  }

  Future<void> adicionarGasto({
    required String descricao,
    required String valor,
    required DateTime data,
  }) async {
    const String virgula = ',';
    const String ponto = '.';

    final gasto = GastoModel(
      descricao: descricao,
      data: data,
      valor: estilizarValor(valor),
    );

    await _repositorio.inserirGasto(gasto);
  }

  double estilizarValor(String valor) {
    valor = valor.replaceAll(",", ".");
    var valores = valor.split(".");
    if(valores.length > 2) {
      valor = "";
      valor += valores[0] + valores[1] + "." + valores[2];
    }
    return double.parse(valor);
  }

  Future<List<GastoModel>> obterTodos() async {
    List<GastoModel> gastos = await GastoRepositorio().gastos();
    return gastos;
  }

  Future<void> atualizarGasto(int? id, double valor, String descricao, DateTime data) async {
    await _repositorio.atualizarGasto(id!, valor, descricao, data);
  }
}
