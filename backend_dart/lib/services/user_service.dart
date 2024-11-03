// backend_dart/lib/services/user_service.dart

import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../config/database_config.dart';

class UserService {
  Future<Response> registerUser(Map<String, dynamic> userData) async {
    final conn = await DatabaseConfig.getConnection();

    try {
      final result = await conn.query(
        'INSERT INTO users (full_name, birth_date, gender, marital_status, id_number, address, phone, email, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          userData['full_name'],
          userData['birth_date'],
          userData['gender'],
          userData['marital_status'],
          userData['id_number'],
          userData['address'],
          userData['phone'],
          userData['email'],
          userData['password']
        ],
      );

      final userId = result.insertId;
      await conn.query(
        'INSERT INTO social_data (user_id, income, housing_condition, employment_status, education_level, special_needs, other_social_programs, health_condition) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [
          userId,
          userData['income'],
          userData['housing_condition'],
          userData['employment_status'],
          userData['education_level'],
          userData['special_needs'],
          userData['other_social_programs'],
          userData['health_condition']
        ],
      );

      return Response.ok(jsonEncode({'message': 'User registered successfully'}));
    } finally {
      await conn.close();
    }
  }

  Future<Response> loginUser(Map<String, dynamic> credentials) async {
    final conn = await DatabaseConfig.getConnection();
    final email = credentials['email'];
    final password = credentials['password'];

    final results = await conn.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [email, password],
    );

    await conn.close();

    if (results.isNotEmpty) {
      return Response.ok(jsonEncode({'message': 'Login successful'}));
    } else {
      return Response.forbidden(jsonEncode({'message': 'Invalid credentials'}));
    }
  }
}
