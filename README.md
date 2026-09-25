# Gerenciamento de Medicamentos

Aplicação desenvolvida em **Flutter** com o objetivo de auxiliar usuários no gerenciamento de medicamentos de uso contínuo, permitindo organizar informações sobre medicamentos, dosagens, horários e frequência de utilização.

O projeto faz parte de uma atividade acadêmica voltada ao desenvolvimento de uma solução tecnológica para o problema de dificuldades no controle de medicamentos de uso contínuo.

## 🎯 Objetivo

Desenvolver uma aplicação simples, acessível e responsiva que auxilie o usuário a organizar seus medicamentos e seus respectivos horários de utilização.

A proposta busca contribuir para uma melhor organização do tratamento, reduzindo problemas relacionados ao esquecimento ou à utilização incorreta dos medicamentos.

## 🚀 Tecnologias utilizadas

* **Flutter** – framework para desenvolvimento da aplicação;
* **Dart** – linguagem de programação utilizada pelo Flutter;
* **Visual Studio Code** – ambiente de desenvolvimento;
* **Android Studio** – ferramentas e emulador para testes Android;
* **Flutter Test** – realização de testes automatizados;
* **Flutter DevTools** – análise e depuração da aplicação;
* **Git** – controle de versão;
* **GitHub** – hospedagem e gerenciamento do código-fonte.

## 🗄️ Banco de dados

O projeto utiliza o **Cloud Firestore**, banco de dados NoSQL orientado a documentos.

Os medicamentos são armazenados na coleção:

```text
medicamentos

## 📱 Funcionalidades implementadas

AAtualmente, a aplicação permite registrar:

- Nome do medicamento;
- Dosagem;
- Frequência de utilização;
- Horário;
- Observações;
- Data de criação do registro.

Os dados são armazenados de forma persistente utilizando o **Cloud Firestore**, serviço de banco de dados NoSQL do Firebase.


## 🖥️ Estrutura do projeto

gerenciamento_medicamentos/
│
├── lib/
│   ├── main.dart
│   ├── firebase_options.dart
│   │
│   ├── models/
│   │   └── medicamento.dart
│   │
│   ├── screens/
│   │   ├── home_screen.dart
│   │   └── cadastro_medicamento_screen.dart
│   │
│   ├── services/
│   │   └── medicamento_service.dart
│   │
│   └── widgets/
│       └── medicamento_card.dart
│
├── test/
│   └── widget_test.dart
│
├── pubspec.yaml
└── README.md

## 🏗️ Organização da aplicação

O projeto foi organizado buscando separar as responsabilidades dos componentes.

### Model

A classe `Medicamento` representa os dados de um medicamento, como:

* nome;
* dosagem;
* horário;
* frequência;
* observação;
* identificador.

### Screens

As telas são responsáveis pela apresentação e interação com o usuário.

* `HomeScreen`: apresenta os medicamentos cadastrados e permite adicionar ou excluir medicamentos.
* `CadastroMedicamentoScreen`: apresenta o formulário para cadastro de um novo medicamento.

### Services

O `MedicamentoService` é responsável pelo gerenciamento dos medicamentos cadastrados.

Na versão atual, os dados são mantidos em memória. Em versões futuras, será utilizada uma solução de persistência, como Firebase/Cloud Firestore.

### Widgets

O `MedicamentoCard` é um componente reutilizável utilizado para apresentar as informações de cada medicamento.

## 📐 Responsividade

A aplicação utiliza recursos do Flutter para permitir sua adaptação a diferentes tamanhos de tela.

Entre os recursos utilizados estão:

* `LayoutBuilder`;
* `SafeArea`;
* `SingleChildScrollView`;
* `ConstrainedBox`;
* `ListView`.

A responsividade foi considerada para possibilitar uma utilização adequada em diferentes dispositivos.

## 🧪 Testes

Para executar os testes automatizados:

```bash
flutter test
```

Para verificar possíveis problemas no código:

```bash
flutter analyze
```

## ▶️ Como executar o projeto

### 1. Pré-requisitos

É necessário possuir instalado:

* Flutter SDK;
* Dart SDK;
* Visual Studio Code;
* extensão Flutter para o Visual Studio Code;
* Android Studio, caso seja utilizado um dispositivo ou emulador Android.

### 2. Clonar o projeto

Projeto no GitHub:

```bash
git clone https://github.com/odairpereira-beep/gerenciamento_medicamentos.git
```

Entre na pasta:

```bash
cd gerenciamento_medicamentos
```

### 3. Instalar as dependências

Execute:

```bash
flutter pub get
```

### 4. Verificar o ambiente

Execute:

```bash
flutter doctor
```

### 5. Executar a aplicação

Para executar no navegador:

```bash
flutter run -d chrome
```

Para executar em um dispositivo Android:

```bash
flutter run
```

## 🔄 Versionamento

O projeto utiliza Git para controle de versão.

Exemplo de fluxo utilizado:

```bash
git status
git add .
git commit -m "Descrição da alteração"
git push
```

As alterações devem ser registradas em commits com mensagens que descrevam de forma objetiva o que foi modificado.

## 🔮 Melhorias futuras

Entre as funcionalidades que serão incorporadas em versões futuras estão:

* autenticação de usuários;
* notificações e lembretes automáticos;
* histórico de utilização dos medicamentos;
* edição de medicamentos cadastrados;
* diferentes perfis de usuários;
* recursos adicionais de acessibilidade;
* sincronização dos dados entre dispositivos;
* melhorias de segurança.

## 👥 Público-alvo

A aplicação é destinada principalmente a pessoas que utilizam medicamentos de forma contínua, especialmente usuários que precisam controlar diferentes medicamentos e horários durante o tratamento.

## 📚 Contexto acadêmico

O projeto foi desenvolvido como parte de uma atividade acadêmica de desenvolvimento de software, aplicando conceitos de:

* Engenharia de Software;
* Desenvolvimento Mobile;
* Flutter;
* Design Thinking;
* Engenharia de Requisitos;
* UML;
* Testes de Software;
* Usabilidade;
* Responsividade;
* Controle de versão.

## 📄 Licença

Este projeto foi desenvolvido para fins acadêmicos.
