import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';

class SocioeconomicDataView extends StatefulWidget {
  @override
  _SocioeconomicDataViewState createState() => _SocioeconomicDataViewState();
}

class _SocioeconomicDataViewState extends State<SocioeconomicDataView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _incomeController = TextEditingController();
  // ... other controllers

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      // Create a socioeconomic data object with the form data
      final socioeconomicData = SocioeconomicData(
        income: _incomeController.text,
        // ... other fields
      );

      // Send data to the backend
      try {
        await ApiService().createSocioeconomicData(socioeconomicData);
        // Navigate to the next screen or show a success message
      } catch (e) {
        // Handle errors, e.g., show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados Socioeconômicos')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _incomeController,
                decoration: InputDecoration(labelText: 'Renda Familiar'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira sua renda familiar';
                  }
                  return null;
                },
              ),
              // ... other TextFormField widgets with validation
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Próximo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}