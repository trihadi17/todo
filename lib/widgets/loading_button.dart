import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 66,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: toscaColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {},
            child: CircularProgressIndicator(
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
