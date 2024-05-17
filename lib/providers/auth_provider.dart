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

  Future<void> postData() async {
    final url = Uri.parse(
        'https://todo-d7e45-default-rtdb.firebaseio.com/users.json'); // Ganti dengan URL Firebase Anda
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print('Specific Value: ${responseData}');
    }
  }
}
