import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../config/database_config.dart';

class AuthService {
  Future<Response> loginUser(Map<String, dynamic> credentials) async {
    final conn = await DatabaseConfig.getConnection();

    try {
      final results = await conn.query(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [credentials['email'], credentials['password']],
      );

      if (results.isNotEmpty) {
        return Response.ok(jsonEncode({'message': 'Login successful'}));
      } else {
        return Response.forbidden(jsonEncode({'error': 'Invalid credentials'}));
      }
    } finally {
      await conn.close();
    }
  }
}
