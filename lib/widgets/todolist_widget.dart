import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

// Model
import 'package:todo/model/todo.dart';

class TodoListWidget extends StatefulWidget {
  TodoModel todo;

  TodoListWidget(this.todo);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0.0,
      child: Container(
        height: 34,
        child: CheckboxListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          title: Text(
            '${widget.todo.task}',
            maxLines: 1,
            style: blackTextStyle.copyWith(
              decoration: widget.todo.isDone == 1
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: toscaColor,
              decorationThickness: 5.0,
              fontSize: 15,
              fontWeight: bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          value: widget.todo.isDone == 1,
          onChanged: (bool value) {
            setState(() {
              widget.todo.isDone = value ? 1 : 0;
            });
          },
          activeColor: toscaColor,
          checkColor: blackColor,
          side: BorderSide(color: blackColor, width: 2),
        ),
      ),
    );
  }
}
