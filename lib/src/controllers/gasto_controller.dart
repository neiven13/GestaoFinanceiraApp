import 'package:granago_app/src/data/services/gasto_repositorio.dart';
import 'package:granago_app/src/models/gasto_model.dart';

class GastoController {
  Future<List<GastoModel>> obterTodos() async {
    List<GastoModel> gastos = await GastoRepositorio().gastos();
    return gastos;
  }
}