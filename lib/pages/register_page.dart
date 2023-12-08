import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared_widgets/shared_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        Navigator.pushReplacementNamed(context, '/home-page');
        print("Created New Account");
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });
      addUserDetails(
          _usernameController.text.trim(), _emailController.text.trim());
    }
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection("users").add({
      'name': name,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      final text = 'As senhas precisam ser iguais';
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sharedTextField(
                    "Nome", Icons.person_outline, false, _usernameController),
                const SizedBox(
                  height: 30,
                ),
                sharedTextField(
                    "E-Mail", Icons.person_outline, false, _emailController),
                const SizedBox(
                  height: 30,
                ),
                sharedTextField(
                    "Senha", Icons.lock_outline, true, _passwordController),
                const SizedBox(
                  height: 30,
                ),
                sharedTextField("Confirme a senha", Icons.lock_outline, true,
                    _confirmPasswordController),
                // InkWell(
                //   child: const Icon(
                //     Icons.photo_camera,
                //     size: 80,
                //   ),
                //   onTap: () {},
                // ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                sharedButton(context, "CADASTRAR", () {
                  signUp();

                  //IF tudo certo == ENTRAR NA HOME PAGE
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
