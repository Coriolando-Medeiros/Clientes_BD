## Gerenciamento de Clientes e Fornecedores

   Este projeto é uma aplicação Ruby que permite gerenciar informações de Clientes e Fornecedores, com funcionalidades para adicionar, listar, editar e excluir registros em banco de dados MySql. Ele utiliza o terminal para a interação com o usuário, apresentando os dados em tabelas organizadas. O sistema também implementa validação de dados, como CPF, CNPJ e número de telefone, utilizando expressões regulares.

## Funcionalidades

### Clientes

   - **Adicionar Cliente**: Permite adicionar um novo cliente ao sistema com nome, telefone e CPF.
   - **Listar Clientes**: Exibe todos os clientes cadastrados em uma tabela.
   - **Editar Cliente**: Permite editar as informações de um cliente já existente.
   - **Excluir Cliente**: Exclui um cliente do sistema.

### Fornecedores

   - **Adicionar Fornecedor**: Adiciona um novo fornecedor ao sistema, incluindo nome, telefone, CNPJ e endereço.
   - **Listar Fornecedores**: Exibe uma lista de todos os fornecedores em uma tabela.
   - **Editar Fornecedor**: Permite modificar os dados de um fornecedor existente.
   - **Excluir Fornecedor**: Remove um fornecedor do sistema.

### Validações

   - **Validação de CPF**: O sistema valida o CPF inserido pelo usuário (formato: XXX.XXX.XXX-XX).
   - **Validação de CNPJ**: O CNPJ inserido é validado conforme o formato padrão (formato: XX.XXX.XXX/XXXX-XX).
   - **Validação de Telefone**: Telefones são validados para garantir o formato correto (formato: (XX) XXXXX-XXXX).

### Interface Interativa

   O sistema utiliza o terminal para exibir menus e listas de clientes e fornecedores. Para isso, são usadas as gems:

   - **terminal-table**: Exibe dados em formato de tabela.
   - **colorize**: Adiciona cores às mensagens no terminal para melhor experiência do usuário.

### Instalação

   1. Clone este repositório:

``` bash

   git clone https://github.com/Coriolando-Medeiros/Clientes_BD.git
```

   2. Acesse o diretório do projeto:

```bash

   cd nome-repositorio
```

### Instale as dependências necessárias:

```bash

   bundle install
```

### Uso

   Execute o arquivo **init.rb** para iniciar o sistema:
```
   bash

   ruby init.rb
```
   Após rodar o comando, o sistema apresentará um menu com as opções de gerenciamento de clientes e fornecedores.
   
### Exemplo de Menu
```
   bash

   🌟             Menu             🌟
   ========================
   =========Cliente========
   1 - Adicionar Cliente
   2 - Listar Clientes
   3 - Editar Cliente
   4 - Excluir Cliente
   ========Fornecedor======
   5 - Adicionar Fornecedor
   6 - Listar Fornecedores
   7 - Editar Fornecedor
   8 - Excluir Fornecedor
   0 - Sair
   ========================
   Opção: 
```
### Estrutura do Projeto

   - **init.rb**: Arquivo principal que inicializa o menu e conecta as funcionalidades.
   - **models/cliente.rb**: Define a estrutura e os métodos relacionados aos clientes.
   - **models/fornecedor.rb**: Define a estrutura e os métodos relacionados aos fornecedores.
   - **dio.rb**: Implementa módulo ORM para operações CRUD em classes Ruby.
   - **estados.rb**: Contém uma tabela de estados brasileiros com suas siglas e nomes.

### Dependências

  - Ruby 2.7+
  - Gems:
        terminal-table
        colorize

### Instale as dependências executando:
```
   bash

   bundle install
```
### Licença

   Este projeto está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais detalhes.
