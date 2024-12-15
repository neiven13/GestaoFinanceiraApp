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
      valor: double.parse(valor.replaceAll(virgula, ponto)),
    );

    await _repositorio.inserirGasto(gasto);
  }

  Future<List<GastoModel>> obterTodos() async {
    List<GastoModel> gastos = await GastoRepositorio().gastos();
    return gastos;
  }

  Future<void> atualizarGasto(int? id, double valor, String descricao, DateTime data) async {
    await _repositorio.atualizarGasto(id!, valor, descricao, data);
  }
}
