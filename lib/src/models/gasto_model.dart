class GastoModel {
  late int _id;
  late String _descricao;
  late DateTime _dataGasto;
  late double _valorGasto;

  GastoModel({
    required int id,
    required String descricao,
    required DateTime dataGasto,
    required double valorGasto,
  }) {
    _id = id;
    _descricao = descricao;
    _dataGasto = dataGasto;
    _valorGasto = valorGasto;
  }

  int get id => _id;
  String get descricao => _descricao;
  DateTime get dataGasto => _dataGasto;
  double get valorGasto => _valorGasto;

  set id(int value) {
    _id = value;
  }

  set descricao(String value) {
    _descricao = value;
  }

  set dataGasto(DateTime value) {
    _dataGasto = value;
  }

  set valorGasto(double value) {
    _valorGasto = value;
  }
}

