import 'package:granago_app/src/data/conexao_banco_de_dados.dart';
import 'package:granago_app/src/models/gasto_model.dart';
import 'package:granago_app/src/data/scripts.dart';

class GastoRepositorio {
  final _banco = ConexaoBancoDeDados().bancoDeDados;

  Future<List<GastoModel>> gastos() async{
    // Query the table for all the dogs.
    List<Map<String,Object?>>? mapeamentoDeGastos = await _banco?.query('gastos');

    final separadorData = '-';
    final indiceAno = 0;
    final indiceMes = 1;
    final indiceDia = 2;

    if(mapeamentoDeGastos!.isNotEmpty) {
      return [
        for (final {
              'id': id as int,
              'descricao': descricao as String,
              'valor': valor as double,
              'data': data as String
            } in mapeamentoDeGastos)
        GastoModel(
          id: id,
          descricao: descricao,
          valor: valor,
          data: DateTime(
            int.parse(data.split(separadorData)[indiceAno]), 
            int.parse(data.split(separadorData)[indiceMes]), 
            int.parse(data.split(separadorData)[indiceDia])
          )
        ),
      ];
    }
    return List.empty();    
  }

  Future<void> inserirGasto(GastoModel gasto) async {
    var sql = adicionarGasto;
    await _banco?.rawInsert(sql,
        [gasto.descricao, gasto.valor, gasto.data.toIso8601String()]);
  }

  void deletar(int id) async {
    const String nomeTabela = 'gastos';
    const String queryWhere = 'id = ?';

    await _banco?.delete(
      nomeTabela,
      where: queryWhere,
      whereArgs: [id],
    );
  }
}