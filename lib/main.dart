import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
import 'pages/splashscreen_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/dashboard_page.dart';

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
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
