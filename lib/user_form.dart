import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'user_model.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _ageController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _dateNaissance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un utilisateur'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 100.ms, duration: 300.ms).slideX(),
                SizedBox(height: 16),
                TextFormField(
                  controller: _prenomController,
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un prénom';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 200.ms, duration: 300.ms).slideX(),
                SizedBox(height: 16),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un âge';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Veuillez entrer un nombre valide';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 300.ms, duration: 300.ms).slideX(),
                SizedBox(height: 16),
                TextFormField(
                  controller: _telephoneController,
                  decoration: InputDecoration(
                    labelText: 'Téléphone',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un numéro de téléphone';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 400.ms, duration: 300.ms).slideX(),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un email';
                    }
                    if (!value.contains('@')) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ).animate().fadeIn(delay: 500.ms, duration: 300.ms).slideX(),
                SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateNaissance = pickedDate;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date de naissance',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dateNaissance == null
                              ? 'Sélectionner une date'
                              : DateFormat('dd/MM/yyyy').format(_dateNaissance!),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 300.ms).slideX(),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _dateNaissance != null) {
                      final newUser = User(
                        id: DateTime.now().toString(),
                        nom: _nomController.text,
                        prenom: _prenomController.text,
                        age: int.parse(_ageController.text),
                        telephone: _telephoneController.text,
                        email: _emailController.text,
                        dateNaissance: _dateNaissance!,
                      );
                      Provider.of<UserProvider>(context, listen: false).addUser(newUser);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Ajouter'),
                ).animate().fadeIn(delay: 700.ms, duration: 300.ms).scale(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}