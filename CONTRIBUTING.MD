# Instruções de como contribuir com o projeto

1. **Clonar o repositório localmente na sua máquina**:
    ```git
    git clone <link do repositorio>
    ```

2. **Navegar até a pasta central do repositório**:
    ```bash
    cd <nome da pasta>
    ```
3. **Atualizar seu repositório local**:
    Antes de começar a trabalhar no projeto, usar o comando `git pull`, esse comando irá baixar todas as atualizações do repositório remoto e colocá-las no seu repositório local. Boa prática para sempre estar com o código atualizado.
4. **Criar uma branch para a sua funcionalidade ou correção**:
    Sempre crie uma branch separada para trabalhar na sua funcionalidade ou correção, com um nome descritivo, usando o comando:
    ```git
    git checkout -b <nome da branch>
    ``` 
    Exemplo:
    ```git
    git checkout -b feat/listar-transacoes
    ``` 
5. **Fazer as suas implementações e 'commitar' as alterações**:
    Faça as alterações que forem necessárias no código, escreva e execute os testes localmente.
    
    Para adicionar na área de stage:
    ```bash
    git add --all
    ```
    Para realizar o commit:
    ```bash
    git commit -m "tipo do commit: Descrição da alteração"
    ``` 
>[!tip]
Para escrever a mensagem do commit pense assim: "Se eu aplicar esse commit, ele vai...  {mensagem do commit}".
>
>**Ex.:** "... adicionar os testes da classe Beltrano"
    
>[!important]
Verifique a **[Convenção de Commits](#convenção-de-commits)** para escrever a mensagem do seu commit de forma padronizada e simples

6. **Enviar sua branch para o repositório remoto**:
Compartilhe as alterações usando o comando `git push origin <nome da branch>`

7. **Abrir um Pull Request**:
Com o repositório aberto no GitHub,

8. **Aguardar revisão**:
Dois contribuidores irão revisar o seu código. Os comentários da revisão aparecerão no Pull Request 

9. **Aprovação e Merge das branches**:
Fim! 🎉Seu pull request foi aprovado e será mesclado na branch principal!


## Convenção de Commits
| Tipo de Commit |Descrição                                                            | Exemplo
| ---------------|----------------------------------------------------------------------|-----------
| `feat`         | Adiciona uma nova funcionalidade ao projeto.                         | `feat: add USENAME.md profile`
| `fix`          | Corrige um bug ou problema no projeto.                               | `fix: fixed issue fix#IssueNumber`
| `docs`         | Altera a documentação do projeto.| `docs: update README.md`
| `style`        | Realiza mudanças na aparência, sem alterar a funcionalidade.         | `style: add EFFECTNAME to COMPONENT`
| `refactor`     | Realiza mudanças no código que não alteram a funcionalidade.         | `refactor: refactor at CLASSNAME`
| `test`         | Adiciona ou modifica testes no projeto.                              | `test: add unit test for UserService`