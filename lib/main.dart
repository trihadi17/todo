import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages

void main() {
  // hanya menampilkan view secara portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Trihadi Putra',
          ),
        ),
      ),
    );
  }
}
