# 🧱Arquitetura

## Visão Geral
Este documento descreve a arquitetura do projeto **GranaGo**, detalhando a organização, camadas e os principais componentes do sistema.

## 🗂️Estrutura do Projeto
O projeto segue uma arquitetura em camadas, para organizar as responsabilidades, baseada em MVC com a adição de **services** para encapsular a lógica de comunicação com o banco de dados.

### 📂Model
Esta pasta contém as definições das entidades de dados usadas pelo sistema.

**Exemplo:** A classe `GastoModel` define a estrutura de um gasto, incluindo os atributos como id, nome, valor, e data.

### 📂Controllers
Esta pasta contém classes que controlam o fluxo de dados entre as Views (páginas) e os Services.

**Exemplo:** A classe GastoController gerencia as ações como criar, editar, listar e deletar gastos.

**Propósito:** Coordenar a comunicação entre as Views e os Services.
### 📂Data
Esta pasta gerencia a comunicação com o banco de dados e a lógica de acesso aos dados.

`Database Connection`: 
Contém utilitários para configurar e gerenciar a conexão com o banco de dados. 
#### 📂Services
Contém a classe `GastoRepository`, responsável por inserir, buscar, atualizar e excluir gastos no banco SQLite.
### 📂Pages
Esta pasta contém as telas (Views) do aplicativo.

**Exemplo:**
A HomePage exibe a lista de gastos e permite ao usuário navegar para as telas de criação ou edição.

### 📂Components
Esta pasta armazena componentes reutilizáveis da interface do usuário (UI).

**Exemplo:**
O AppBarComponent define um cabeçalho padrão para o aplicativo.

**Propósito:**
Evitar duplicação de código na UI.
Facilitar a manutenção e a consistência visual do aplicativo.

### Estrutura de Arquivos
``` 
📦lib
 📂src  
 ┃ ┣ 📂components
 ┃ ┃ ┗ 📜appbar_component.dart
 ┃ ┣ 📂controllers
 ┃ ┃ ┗ 📜gasto_controller.dart
 ┃ ┣ 📂data
 ┃ ┃ ┣ 📂services
 ┃ ┃ ┃ ┗ 📜gasto_repository.dart
 ┃ ┃ ┗ 📜database_connection.dart
 ┃ ┣ 📂models
 ┃ ┃ ┗ 📜gasto_model.dart
 ┃ ┗ 📂pages
 ┃ ┃ ┗ 📜home_page.dart
 ┣ 📜app_widget.dart
 ┗ 📜main.dart 
 ```
