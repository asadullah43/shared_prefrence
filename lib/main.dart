import 'package:flutter/material.dart';
import 'package:shared_pref/home_screen.dart';
import 'package:shared_pref/login_screen.dart';
import 'package:shared_pref/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: SplashScreen.id, routes: {
      HomeScreen.id: (context) => const HomeScreen(),
      LoginScreen.id: ((context) => const LoginScreen()),
      SplashScreen.id: (context) => const SplashScreen(),
    });
  }
}
