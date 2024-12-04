import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql1/mysql1.dart';

class UserService {
  final MySqlConnection connection;

  UserService(this.connection);

  Router get router {
    final router = Router();

    router.post('/register', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);

      // Extraia todos os campos necessários
      final fullName = data['full_name'];
      final birthDate = data['birth_date'];
      final gender = data['gender'];
      final maritalStatus = data['marital_status'];
      final idNumber = data['id_number'];
      final address = data['address'];
      final phone = data['phone'];
      final email = data['email'];
      final password = data['password']; // Certifique-se de hash/salvar a senha com segurança.
      final income = data['income'];
      final housingCondition = data['housing_condition'];
      final employmentStatus = data['employment_status'];
      final educationLevel = data['education_level'];
      final familyComposition = data['family_composition'];
      final specialNeeds = data['special_needs'];
      final otherSocialPrograms = data['other_social_programs'];
      final healthCondition = data['health_condition'];

      // Insira os dados no banco de dados
      try {
        await connection.query(
          '''INSERT INTO users 
          (full_name, birth_date, gender, marital_status, id_number, address, phone, email, password, income, housing_condition, employment_status, education_level, family_composition, special_needs, other_social_programs, health_condition) 
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
          [
            fullName, birthDate, gender, maritalStatus, idNumber, address, phone, email, password, income, housingCondition, employmentStatus, educationLevel, familyComposition, specialNeeds, otherSocialPrograms, healthCondition
          ],
        );
        return Response.ok(jsonEncode({'message': 'Cadastro concluído com sucesso'}));
      } catch (e) {
        return Response.internalServerError(body: jsonEncode({'error': 'Erro ao salvar dados'}));
      }
    });

    return router;
  }
}
