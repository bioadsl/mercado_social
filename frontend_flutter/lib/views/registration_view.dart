import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    // Adicione outros controladores conforme necessário
    final ApiService apiService = ApiService(); // Instância do serviço

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Adicione os campos de texto para as informações do usuário
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              // Outros campos de entrada aqui...

              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> userData = {
                    'email': emailController.text,
                    'password': passwordController.text,
                    // Adicione outros campos conforme necessário
                  };

                  // Chame o método de registro e aguarde a resposta
                  final response = await apiService.registerUser(userData);

                  // Verifique a resposta
                  if (response['message'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                    // Navegue para outra tela, se necessário
                  } else if (response['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['error'])),
                    );
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
