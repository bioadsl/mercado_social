import 'package:flutter/material.dart';
import 'package:frontend_flutter/views/login_view.dart';
import 'package:frontend_flutter/views/registration_view.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Social',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/': (context) => RegistrationView(),
        
      },
    );
  }
}
