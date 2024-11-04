import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql1/mysql1.dart';

// Configurações do banco de dados
final dbSettings = ConnectionSettings(
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'SUA_SENHA_AQUI', // Insira a senha correta se necessário
  db: 'market_control',
);

// Classe de serviço para APIs
class ApiService {
  Future<Response> registerUser(Request request) async {
    MySqlConnection? conn;
    try {
      final data = jsonDecode(await request.readAsString());
      conn = await MySqlConnection.connect(dbSettings);

      final result = await conn.query(
        'INSERT INTO users (full_name, birth_date, gender, marital_status, id_number, address, phone, email, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          data['full_name'],
          data['birth_date'],
          data['gender'],
          data['marital_status'],
          data['id_number'],
          data['address'],
          data['phone'],
          data['email'],
          data['password'],
        ],
      );

      final userId = result.insertId;

      if (data['income'] != null) {
        await conn.query(
          'INSERT INTO social_data (user_id, income, housing_condition, employment_status, education_level, special_needs, other_social_programs, health_condition) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
          [
            userId,
            data['income'],
            data['housing_condition'],
            data['employment_status'],
            data['education_level'],
            data['special_needs'],
            data['other_social_programs'],
            data['health_condition'],
          ],
        );
      }

      return Response.ok(jsonEncode({'message': 'User registered successfully'}),
          headers: {'Content-Type': 'application/json'});
    } on MySqlException catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': e.message}),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': 'Failed to register user'}),
          headers: {'Content-Type': 'application/json'});
    } finally {
      await conn?.close();
    }
  }

  Future<Response> loginUser(Request request) async {
    MySqlConnection? conn;
    try {
      final data = jsonDecode(await request.readAsString());
      conn = await MySqlConnection.connect(dbSettings);

      final results = await conn.query(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [data['email'], data['password']],
      );

      if (results.isNotEmpty) {
        return Response.ok(jsonEncode({'message': 'Login successful'}),
            headers: {'Content-Type': 'application/json'});
      } else {
        return Response.forbidden(jsonEncode({'error': 'Invalid credentials'}),
            headers: {'Content-Type': 'application/json'});
      }
    } on MySqlException catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': e.message}),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({'error': 'Failed to login'}),
          headers: {'Content-Type': 'application/json'});
    } finally {
      await conn?.close();
    }
  }
}

// Middleware para habilitar CORS
Response _corsMiddleware(Response response) {
  return response.change(headers: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
  });
}

// Middleware para lidar com requisições OPTIONS e adicionar o cabeçalho CORS
Handler addCors(Handler handler) {
  final pipeline = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware((innerHandler) {
    return (request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        });
      }
      final response = await innerHandler(request);
      return _corsMiddleware(response);
    };
  });
  return pipeline.addHandler(handler);
}

void main() async {
  final apiService = ApiService();
  final router = Router();

router.post('/users/register', apiService.registerUser);
router.post('/users/login', apiService.loginUser);

  // Adiciona o middleware CORS
  final handler = addCors(router);

  await io.serve(handler, 'localhost', 8080);
  print('Server listening on http://localhost:8080');
}
