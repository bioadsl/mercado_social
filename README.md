# Controle de Mercado Social

Este projeto é um aplicativo Flutter para controle de um mercado social, com funcionalidades de login, cadastro de dados pessoais e socioeconômicos, tela de boas-vindas e perfil com edição de dados. O backend foi desenvolvido em Dart com o framework Shelf e banco de dados MySQL.

## Requisitos do Sistema

### Funcionalidades Principais

1. **Login de Usuário**:
   - Autenticação com email e senha.
   - Após login, o usuário é redirecionado para a **Tela de Boas-Vindas**.

2. **Cadastro de Dados Pessoais**:
   - Nome completo
   - Data de nascimento
   - Gênero
   - Estado civil
   - Número de identificação (RG, CPF ou outro documento oficial)
   - Endereço completo
   - Telefone e e-mail
   - Foto de perfil

3. **Cadastro de Dados Socioeconômicos**:
   - Renda familiar total
   - Condição de moradia (própria, alugada, cedida, etc.)
   - Situação de emprego (empregado, desempregado, informal)
   - Nível de escolaridade
   - Composição familiar: Nome, relacionamento, idade e ocupação de outros membros.

4. **Critérios Específicos do Programa**:
   - Necessidades especiais (se houver)
   - Participação em outros programas sociais (ex: Bolsa Família, Auxílio Emergencial)
   - Situação de saúde (doenças crônicas, incapacidade)

5. **Tela de Boas-Vindas**:
   - Exibida após o login com uma mensagem personalizada.

6. **Tela de Perfil do Usuário**:
   - Permite a visualização e edição dos dados pessoais e socioeconômicos.
   - Inclui a possibilidade de atualizar a **foto de perfil**.

### Arquitetura

- **Frontend**: Flutter
- **Backend**: Dart com o framework Shelf
- **Banco de Dados**: MySQL

### Instalação

#### Backend

1. Instale as dependências:
   ```bash
   dart pub get
   ```
#### Frontend

2. Navegue até o diretório do frontend Flutter e instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter flutter run
   ```


###  Uso

Ao abrir o aplicativo, você pode se registrar ou fazer login.
Após o login, você será direcionado para a tela de boas-vindas.
Na tela de perfil, você poderá visualizar, editar suas informações e adicionar uma foto de perfil.


### Estrutura do Projeto

frontend_flutter/: Código do aplicativo Flutter.
backend_dart/: Código do backend em Dart com Shelf.
database/: Scripts e configurações do banco de dados MySQL.


### Contribuição

- Faça um fork do projeto.
- Crie uma nova branch (git checkout -b minha-feature).
- Commit as alterações (git commit -m 'Minha nova feature').
- Envie para o branch (git push origin minha-feature).
- Abra um Pull Request.
- Este projeto é licenciado sob a MIT License.