const criarTabelaGastos = '''
CREATE TABLE gastos (
  id INTEGER PRIMARY KEY,
  descricao VARCHAR(80) NOT NULL,
  valor REAL NOT NULL,
  data TEXT NOT NULL
);
''';

const adicionarGasto = '''
INSERT INTO gastos (descricao,valor,data) VALUES(?,?,?)
''';
