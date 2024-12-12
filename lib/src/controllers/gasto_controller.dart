import 'package:granago_app/src/data/services/gasto_repository.dart';
import 'package:granago_app/src/models/gasto_model.dart';

class GastoController {
  final GastoRepository _repository;
  GastoController(this._repository);

  Future<void> addGasto({
    required String descricao,
    required String valor,
    required DateTime data,
  }) async {
    final gasto = GastoModel(
      descricao: descricao,
      dataGasto: data,
      valorGasto: double.parse(valor.replaceAll(',', '.')),
    );

    await _repository.insertGasto(gasto);
  }
}
