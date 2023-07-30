// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/models/users.dart' as model;
import 'package:insta_clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  final AuthMethod _authMethod = AuthMethod();
  model.User? _user;

  model.User get getUser => _user!;

  Future<void> refreshUser() async {
    model.User user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
