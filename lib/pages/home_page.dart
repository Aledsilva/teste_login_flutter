import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 200,
            //   width: 150,
            //   child: Image.network(
            //       "https://s2-oglobo.glbimg.com/CvRnMai0Um4synVbwseVuxGgoxg=/0x0:1024x1024/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2022/B/c/E2AX3uSWyBqSzncbwx5A/3.glbimg.com-v1-auth-0ae9f161c1ff459593599b7ffa1a1292-images-escenic-2022-4-13-19-1649888639951.jpg"),
            // ),
            Text("Nome"),
            const SizedBox(
              height: 30,
            ),
            Text("Email"),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("SAIU, VAZOU, SE ESCAFEDEU, PEGOU O BECO");
                  Navigator.pushReplacementNamed(context, '/login-page');
                });
              },
              child: Text('LOGOUT'),
            )
          ],
        ),
      ),
    );
  }
}
