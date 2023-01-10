import 'package:flutter/material.dart';

import 'package:shared_pref/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('lOGIN')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'password',
                ),
              ),
              TextFormField(
                controller: agecontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'age',
                ),
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailcontroller.text.toString());
                  sp.setString('password', passwordcontroller.text.toString());
                  sp.setString('age', agecontroller.text.toString());
                  sp.setBool('isLogin', true);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('Login')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
