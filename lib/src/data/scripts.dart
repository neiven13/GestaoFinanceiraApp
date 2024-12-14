const criarTabelaGastos = '''
CREATE TABLE gastos (
  id INTEGER PRIMARY KEY,
  descricao VARCHAR(80) NOT NULL,
  valorGasto REAL NOT NULL,
  dataGasto TEXT NOT NULL
);
''';

const adicionarGasto = '''
INSERT INTO gastos (descricao,valorGasto,dataGasto) VALUES(?,?,?)
''';
