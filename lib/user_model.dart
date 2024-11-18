import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String nom;
  final String prenom;
  final int age;
  final String telephone;
  final String email;
  final DateTime dateNaissance;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.telephone,
    required this.email,
    required this.dateNaissance,
  });
}

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      notifyListeners();
    }
  }
}