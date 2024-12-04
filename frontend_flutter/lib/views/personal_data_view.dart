// personal_data_view.dart

import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';

class PersonalDataView extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados Pessoais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Nome Completo'),
            ),
            // Demais campos aqui...
            ElevatedButton(
              onPressed: () {
                // Avança para a próxima tela (dados socioeconômicos)
                Navigator.pushNamed(context, '/socioeconomic-data'); // Navegue para a rota específica
              },
              child: const Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}