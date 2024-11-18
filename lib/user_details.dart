import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'user_model.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'utilisateur'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Text(
                    user.prenom[0].toUpperCase() + user.nom[0].toUpperCase(),
                    style: TextStyle(fontSize: 40, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ).animate().fadeIn(duration: 500.ms).slideY(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailItem(context, 'Nom', user.nom),
                  _buildDetailItem(context, 'Prénom', user.prenom),
                  _buildDetailItem(context, 'Age', user.age.toString()),
                  _buildDetailItem(context, 'Téléphone', user.telephone),
                  _buildDetailItem(context, 'Email', user.email),
                  _buildDetailItem(context, 'Date de naissance', DateFormat('dd/MM/yyyy').format(user.dateNaissance)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(value),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideX();
  }
}