import 'package:flutter/material.dart';

// Theme
import 'package:todo/theme.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dashboard', style: blackTextStyle),
      ),
    );
  }
}
