const createTable = '''
CREATE TABLE gastos (
  id INTEGER PRIMARY KEY,
  descricao VARCHAR(80) NOT NULL,
  valorGasto REAL NOT NULL,
  dataGasto TEXT NOT NULL
);
''';
