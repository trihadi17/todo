import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen', style: blackTextStyle),
      ),
    );
  }
}
