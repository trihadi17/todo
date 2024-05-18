import 'dart:convert';

import 'package:flutter/material.dart';

// Model
import 'package:todo/model/todo.dart';

// Package
import 'package:http/http.dart' as http;

class TodoService {
  // URL API
  String baseUrl = "https://todos-trihadi.000webhostapp.com/api";

  Future<List<TodoModel>> getTodos(
    String token,
  ) async {
    // URL
    Uri url = Uri.parse('$baseUrl/todo');

    // Header
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    // Response
    var response = await http.get(
      url,
      headers: headers,
    );

    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      // List Data
      List data = jsonDecode(response.body)['data'];

      List<TodoModel> todos = [];

      for (var item in data) {
        todos.add(TodoModel.fromJson(item));
      }

      return todos;
    } else {
      throw Exception('Failed');
    }
  }

  Future<void> addTodo(String token, String task) async {
    // URL
    Uri url = Uri.parse('$baseUrl/todo');

    // Header
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    // Json Encode
    var body = jsonEncode({
      'task': task,
    });

    // Request
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('success');
    } else {
      throw Exception('Failed to add');
    }
  }
}
