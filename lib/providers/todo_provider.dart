import 'package:flutter/material.dart';

// Model
import 'package:todo/model/todo.dart';

// Service
import 'package:todo/services/todo_service.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  set todos(List<TodoModel> todos) {
    _todos = todos;
    notifyListeners();
  }

  Future<void> getTodos(
    String token,
  ) async {
    try {
      List<TodoModel> todos = await TodoService().getTodos(token);
      print(todos.length);
      _todos = todos;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed');
    }
  }
}
