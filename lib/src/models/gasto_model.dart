class GastoModel {
  final int? id;
  final String descricao;
  final double valor;
  final DateTime data;

  const GastoModel({
    this.id,
    required this.descricao,
    required this.valor,
    required this.data
  });
}
