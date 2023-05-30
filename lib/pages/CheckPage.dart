import 'package:estudo_de_caso/pages/HomePage.dart';
import 'package:estudo_de_caso/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
        );
      } else {
        Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
