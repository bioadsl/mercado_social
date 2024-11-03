import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:frontend_flutter/services/user_service.dart'; // Importação correta

void main() async {
  final router = Router();
  final userService = UserService();

  // Define rotas POST para registro e login
  router.post('/users/register', (Request request) async {
    final body = await request.readAsString();
    final userData = jsonDecode(body);
    return userService.registerUser(userData);
  });

  router.post('/users/login', (Request request) async {
    final body = await request.readAsString();
    final credentials = jsonDecode(body);
    return userService.loginUser(credentials);
  });

  // Middleware para permitir CORS
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(_corsMiddleware()) // Adiciona o middleware de CORS aqui
      .addHandler(router);

  // Inicia o servidor
  final server = await serve(handler, 'localhost', 8080);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}

// Middleware para configurar CORS
Middleware _corsMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      // Responde a requisições de preflight OPTIONS com os cabeçalhos de CORS
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: _corsHeaders());
      }

      // Processa as demais requisições e aplica cabeçalhos de CORS na resposta
      final response = await innerHandler(request);
      return response.change(headers: _corsHeaders());
    };
  };
}

// Função auxiliar para cabeçalhos de CORS
Map<String, String> _corsHeaders() {
  return {
    'Access-Control-Allow-Origin': '*', // Permite acesso de qualquer origem
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS', // Permite todos os métodos relevantes
    'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept, x-client-key, x-client-token, x-client-secret, Authorization', // Define cabeçalhos permitidos
    'Access-Control-Allow-Credentials': 'true', // Permite envio de credenciais
  };
}
