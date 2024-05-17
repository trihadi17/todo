import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
import 'pages/splashscreen_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/dashboard_page.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:todo/providers/auth_provider.dart';

void main() {
  // hanya menampilkan view secara portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/onboarding': (context) => OnboardingPage(),
          '/login': (context) => LoginPage(),
          '/registration': (context) => RegistrationPage(),
          '/dashboard': (context) => DashboardPage(),
        },
      ),
    );
  }
}
