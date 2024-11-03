# Controle de Mercado Social

Este projeto é um aplicativo Flutter para controle de um mercado social, com funcionalidades de login, cadastro de dados pessoais e dados socioeconômicos. O backend foi desenvolvido em Dart com o framework Shelf e banco de dados MySQL.

## Requisitos do Sistema

### Funcionalidades Principais

1. **Login de Usuário**:
   - Autenticação com email e senha.

2. **Cadastro de Dados Pessoais**:
   - Nome completo
   - Data de nascimento
   - Gênero
   - Estado civil
   - Número de identificação (RG, CPF, ou outro documento oficial)
   - Endereço completo
   - Telefone e e-mail (opcional)

3. **Cadastro de Dados Socioeconômicos**:
   - Composição familiar: Nome, relacionamento, idade, ocupação de outros membros.
   - Renda familiar total
   - Condição de moradia (própria, alugada, cedida, etc.)
   - Situação de emprego (empregado, desempregado, informal)
   - Nível de escolaridade

4. **Critérios Específicos do Programa**:
   - Necessidades especiais (se houver)
   - Participação em outros programas sociais (ex: Bolsa Família, Auxílio Emergencial)
   - Situação de saúde (doenças crônicas, incapacidade)

### Arquitetura

- **Frontend**: Flutter
- **Backend**: Dart com o framework Shelf
- **Banco de Dados**: MySQL

### Instalação

#### Backend

1. Instale as dependências:
   ```bash
   dart pub get
