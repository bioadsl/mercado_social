import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8080';

  // Método para registrar um usuário
  Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );
      return jsonDecode(response.body); // Retorna a resposta como Map
    } catch (e) {
      print('Erro de conexão: $e');
      return {'error': 'Erro de conexão'};
    }
  }

  // Método para login de um usuário
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      return jsonDecode(response.body); // Retorna a resposta como Map
    } catch (e) {
      print('Erro de conexão: $e');
      return {'error': 'Erro de conexão'};
    }
  }
}
