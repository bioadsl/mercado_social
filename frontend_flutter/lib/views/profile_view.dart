import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'qr_code_view.dart'; // Importe a tela do QR Code

class ProfileView extends StatefulWidget {
  final Map<String, dynamic> userData;

  const ProfileView({Key? key, required this.userData}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController fullNameController;
  late TextEditingController birthDateController;
  late TextEditingController genderController;
  late TextEditingController maritalStatusController;
  late TextEditingController idNumberController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController incomeController;
  late TextEditingController housingConditionController;
  late TextEditingController employmentStatusController;
  late TextEditingController educationLevelController;

  File? _profileImage;

  @override
  void initState() {
    super.initState();

    // Inicializa os controladores com dados do usuário
    fullNameController = TextEditingController(text: widget.userData['full_name']);
    birthDateController = TextEditingController(text: widget.userData['birth_date']);
    genderController = TextEditingController(text: widget.userData['gender']);
    maritalStatusController = TextEditingController(text: widget.userData['marital_status']);
    idNumberController = TextEditingController(text: widget.userData['id_number']);
    addressController = TextEditingController(text: widget.userData['address']);
    phoneController = TextEditingController(text: widget.userData['phone']);
    emailController = TextEditingController(text: widget.userData['email']);
    incomeController = TextEditingController(text: widget.userData['income']);
    housingConditionController = TextEditingController(text: widget.userData['housing_condition']);
    employmentStatusController = TextEditingController(text: widget.userData['employment_status']);
    educationLevelController = TextEditingController(text: widget.userData['education_level']);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const AssetImage('assets/profile_placeholder.png') as ImageProvider,
                child: _profileImage == null
                    ? const Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Nome Completo'),
            ),
            TextField(
              controller: birthDateController,
              decoration: const InputDecoration(labelText: 'Data de Nascimento'),
            ),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(labelText: 'Gênero'),
            ),
            TextField(
              controller: maritalStatusController,
              decoration: const InputDecoration(labelText: 'Estado Civil'),
            ),
            TextField(
              controller: idNumberController,
              decoration: const InputDecoration(labelText: 'Número de Identificação'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Endereço Completo'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: incomeController,
              decoration: const InputDecoration(labelText: 'Renda Familiar Total'),
            ),
            TextField(
              controller: housingConditionController,
              decoration: const InputDecoration(labelText: 'Condição de Moradia'),
            ),
            TextField(
              controller: employmentStatusController,
              decoration: const InputDecoration(labelText: 'Situação de Emprego'),
            ),
            TextField(
              controller: educationLevelController,
              decoration: const InputDecoration(labelText: 'Nível de Escolaridade'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ao pressionar o botão, navegue para a tela de QR Code
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrCodeView(
                      data: widget.userData['id_number'], // Passa o número de identificação ou outro dado
                    ),
                  ),
                );
              },
              child: const Text('Gerar QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
