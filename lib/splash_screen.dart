import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref/home_screen.dart';
import 'package:shared_pref/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;
    if (isLogin) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, HomeScreen.id);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, LoginScreen.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: Image(
        width: double.infinity,
        fit: BoxFit.fitWidth,
        image: AssetImage('images/wallpaper.png'),
      ),
    ));
  }
}
