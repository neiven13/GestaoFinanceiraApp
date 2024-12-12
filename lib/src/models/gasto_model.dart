class GastoModel {
  int? id;
  String descricao;
  DateTime dataGasto;
  double valorGasto;

  GastoModel({
    this.id,
    required this.descricao,
    required this.dataGasto,
    required this.valorGasto,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'descricao': descricao,
      'dataGasto': dataGasto.toIso8601String(),
      'valorGasto': valorGasto,
    };
    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
