import 'dart:convert';

import 'package:flutter/material.dart';

// Model
import 'package:todo/model/user.dart';

// Service
import 'package:todo/services/auth_service.dart';

// Package
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name,
    String email,
    String password,
  }) async {
    // try catch
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
      );

      _user = user;
      print(user.token);

      return true;
    } catch (e) {
      return false;
    }
  }
}
