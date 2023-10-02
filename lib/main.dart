import 'package:echo/screens/auth/login.dart';
import 'package:echo/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:echo/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
    useMaterial3: true,
    // colorScheme: ColorScheme.fromSeed(
    //   brightness: Brightness.light,
    //   seedColor: const Color(0xFFEFE1D1),
    // ),
    textTheme: GoogleFonts.latoTextTheme(),
    scaffoldBackgroundColor: const Color(0xFFEFE1D1));

final routes = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      routes: routes,
      home: const LandingScreen(),
    );
  }
}
