import 'dart:convert';

// Model
import 'package:todo/model/user.dart';

// Package
import 'package:http/http.dart' as http;

class AuthService {
  // URL API
  String baseUrl = "https://todo-d7e45-default-rtdb.firebaseio.com/users.json";

  // Registration
  Future<UserModel> register({
    String name,
    String email,
    String password,
  }) async {
    // URL
    Uri url = Uri.parse('$baseUrl');

    // Header
    var headers = {'Content-Type': 'application/json'};

    // Json Encode
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    // Request
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('Registration Failed');
    }
  }
}
