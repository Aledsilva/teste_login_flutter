import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared_widgets/shared_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _login_email_controller = TextEditingController();
  final TextEditingController _login_password_controller =
      TextEditingController();

  signIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _login_email_controller.text,
            password: _login_password_controller.text)
        .then((value) {
      print("O OUSADO LOGOU");
      Navigator.pushReplacementNamed(context, '/home-page');
    }).onError((error, stackTrace) {
      const text = 'Preencha os campos corretamente';
      final snackBar = const SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
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
              children: [
                sharedTextField("E-Mail", Icons.person_outline, false,
                    _login_email_controller),
                const SizedBox(
                  height: 30,
                ),
                sharedTextField(
                    "Senha", Icons.lock, true, _login_password_controller),
                const SizedBox(
                  height: 30,
                ),
                sharedButton(context, "ENTRAR", () {
                  signIn();
                }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ainda não tem uma conta?",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/register-page');
                      },
                      child: const Text(
                        ' Cadastre-se',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
