import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';
import 'package:frontend_flutter/views/registration_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final ApiService apiService = ApiService(); // Instância do serviço

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;

                  final response = await apiService.loginUser(email, password); // Chamada corrigida

                  if (response['message'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                    // Navegue para a próxima tela
                  } else if (response['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['error'])),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navegar para a tela de cadastro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationView()),
                  );
                },
                child: const Text('Não tem uma conta? Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
