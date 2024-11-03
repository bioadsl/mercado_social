import 'dart:convert';
import 'package:shelf/shelf.dart';

class UserService {
  // Método para registrar um usuário
  Response registerUser(Map<String, dynamic> userData) {
    // Aqui você pode adicionar a lógica para registrar o usuário
    return Response.ok(
      jsonEncode({'status': 'success', 'message': 'User registered successfully.'}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // Método para login
  Response loginUser(Map<String, dynamic> credentials) {
    // Aqui você pode adicionar a lógica para fazer login
    return Response.ok(
      jsonEncode({'status': 'success', 'message': 'User logged in successfully.'}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
