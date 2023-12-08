import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste_login_flutter/pages/home_page.dart';
import 'package:teste_login_flutter/pages/login_page.dart';
import 'package:teste_login_flutter/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const LoginPage(),
      '/login-page': (context) => const LoginPage(),
      '/register-page': (context) => const RegisterPage(),
      '/home-page': (context) => const HomePage(),
    },
  ));
}
