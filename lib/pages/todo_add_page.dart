import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/auth_provider.dart';
import 'package:todo/providers/todo_provider.dart';

// Theme
import 'package:todo/theme.dart';

// Service
import 'package:todo/services/todo_service.dart';

class TodoAddPage extends StatelessWidget {
  // TextEditingController
  TextEditingController addController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // Provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget addInput() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 33,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                'Task',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 19,
                vertical: 14,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: TextFormField(
                controller: addController,
                textInputAction: TextInputAction.next,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Task',
                  hintStyle: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                    color: blackColor.withOpacity(0.5),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget addButton() {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: toscaColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                TodoService()
                    .addTodo(authProvider.user.token, addController.text)
                    .then((value) {
                  Provider.of<TodoProvider>(context, listen: false)
                      .getTodos(authProvider.user.token);
                  Navigator.pop(context);
                  addController.clear();
                });
              },
              child: Text(
                'Add',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo Add',
          style: whiteTextStyle,
        ),
        backgroundColor: toscaColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          addInput(),
          addButton(),
        ],
      ),
    );
  }
}
