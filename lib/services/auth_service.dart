import 'dart:convert';

// Model
import 'package:todo/model/user.dart';

// Package
import 'package:http/http.dart' as http;

class AuthService {
  // URL API
  String baseUrl = "https://todos-trihadi.000webhostapp.com/api";

  // Registration
  Future<UserModel> register({
    String name,
    String email,
    String password,
  }) async {
    // URL
    Uri url = Uri.parse('$baseUrl/register');

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

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel user = UserModel.fromJson(data['user']);

      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Registration Failed');
    }
  }
}
