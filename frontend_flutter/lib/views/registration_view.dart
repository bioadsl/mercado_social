import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';
import 'package:frontend_flutter/models/user.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final genderController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final idNumberController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Libere os controladores quando o widget for destruído
    fullNameController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    maritalStatusController.dispose();
    idNumberController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      // Crie um objeto User com dados do formulário
      final user = User(
        fullName: fullNameController.text,
        birthDate: DateTime.tryParse(birthDateController.text) ?? DateTime.now(),
        gender: genderController.text,
        maritalStatus: maritalStatusController.text,
        idNumber: idNumberController.text,
        address: addressController.text,
        phone: phoneController.text,
        email: emailController.text,
      );

      // Converta o objeto User em um Map<String, dynamic>
      final userData = user.toJson();

      try {
        final response = await ApiService().registerUser(userData);
        // Exiba uma mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário registrado com sucesso!')),
        );
        // Opcional: Navegue para outra tela ou limpe o formulário
        _formKey.currentState!.reset();
      } catch (e) {
        // Exiba mensagem de erro ao usuário
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao registrar usuário: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome Completo'),
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome completo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Data de Nascimento'),
                  controller: birthDateController,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua data de nascimento';
                    }
                    try {
                      DateTime.parse(value); // Valida o formato
                    } catch (_) {
                      return 'Por favor, insira uma data válida (AAAA-MM-DD)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Gênero'),
                  controller: genderController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu gênero';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Estado Civil'),
                  controller: maritalStatusController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu estado civil';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Número de Identificação'),
                  controller: idNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu número de identificação';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Endereço Completo'),
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu endereço';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu telefone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registerUser,
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
