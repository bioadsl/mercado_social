import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final String userName;

  const WelcomeView({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo!'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Ajustar o padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName.isEmpty ? 'Olá!' : 'Olá, $userName!',
                style: Theme.of(context).textTheme.headline5, // Utilizar o tema
              ),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo ao Mercado Social! Aqui você pode acessar e gerenciar suas informações.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Text('Ver Perfil'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementação para editar perfil
                },
                child: const Text('Editar Perfil'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementação para sair do sistema
                },
                child: const Text('Sair'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}