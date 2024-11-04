import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController birthDateController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController maritalStatusController = TextEditingController();
    final TextEditingController idNumberController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController incomeController = TextEditingController();
    final TextEditingController housingConditionController = TextEditingController();
    final TextEditingController employmentStatusController = TextEditingController();
    final TextEditingController educationLevelController = TextEditingController();
    final TextEditingController otherSocialProgramsController = TextEditingController();
    final TextEditingController healthConditionController = TextEditingController();
    bool specialNeeds = false;

    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(fullNameController, 'Nome Completo'),
              _buildTextField(birthDateController, 'Data de Nascimento (yyyy-mm-dd)'),
              _buildTextField(genderController, 'Gênero'),
              _buildTextField(maritalStatusController, 'Estado Civil'),
              _buildTextField(idNumberController, 'Número de Identidade'),
              _buildTextField(addressController, 'Endereço'),
              _buildTextField(phoneController, 'Telefone'),
              _buildTextField(emailController, 'Email'),
              _buildTextField(passwordController, 'Senha', obscureText: true),
              _buildTextField(incomeController, 'Renda'),
              _buildTextField(housingConditionController, 'Condição de Moradia'),
              _buildTextField(employmentStatusController, 'Status de Emprego'),
              _buildTextField(educationLevelController, 'Nível de Educação'),
              SwitchListTile(
                title: const Text('Necessidades Especiais'),
                value: specialNeeds,
                onChanged: (bool value) {
                  specialNeeds = value;
                },
              ),
              _buildTextField(otherSocialProgramsController, 'Outros Programas Sociais'),
              _buildTextField(healthConditionController, 'Condição de Saúde'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> userData = {
                    'full_name': fullNameController.text,
                    'birth_date': birthDateController.text,
                    'gender': genderController.text,
                    'marital_status': maritalStatusController.text,
                    'id_number': idNumberController.text,
                    'address': addressController.text,
                    'phone': phoneController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                    'income': incomeController.text,
                    'housing_condition': housingConditionController.text,
                    'employment_status': employmentStatusController.text,
                    'education_level': educationLevelController.text,
                    'special_needs': specialNeeds,
                    'other_social_programs': otherSocialProgramsController.text,
                    'health_condition': healthConditionController.text,
                  };

                  final response = await apiService.registerUser(userData);

                  if (response['message'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['message'])),
                    );
                    Navigator.pop(context);
                  } else if (response['error'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response['error'])),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
        obscureText: obscureText,
      ),
    );
  }
}
