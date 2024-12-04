import 'package:flutter/material.dart';
import 'package:frontend_flutter/services/api_service.dart';

class ProgramCriteriaView extends StatefulWidget {
  @override
  _ProgramCriteriaViewState createState() => _ProgramCriteriaViewState();
}

class _ProgramCriteriaViewState extends State<ProgramCriteriaView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _specialNeedsController = TextEditingController();
  // ... other controllers

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      // Create a program criteria object with the form data
      final criteria = ProgramCriteria(
        specialNeeds: _specialNeedsController.text,
        // ... other fields
      );

      // Send data to the backend
      try {
        await ApiService().createProgramCriteria(criteria);
        // Navigate to the next screen or show a success message
      } catch (e) {
        // Handle errors, e.g., show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Critérios Específicos')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _specialNeedsController,
                decoration: InputDecoration(labelText: 'Necessidades Especiais'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira as necessidades especiais';
                  }
                  return null;
                },
              ),
              // ... other TextFormField widgets with validation
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Concluir Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}