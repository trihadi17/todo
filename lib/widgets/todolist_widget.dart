import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      height: 23,
      child: ListTileTheme(
        horizontalTitleGap: 0.0,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Learn programming by 12am ',
            maxLines: 1,
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          value: false,
          onChanged: (bool value) {},
          activeColor: toscaColor,
          checkColor: blackColor,
          side: BorderSide(color: blackColor, width: 2),
        ),
      ),
    );
  }
}
