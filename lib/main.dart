import 'package:echo/screens/auth/login.dart';
import 'package:echo/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:echo/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:echo/screens/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
  '/home': (context) => const HomeScreen(),
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
