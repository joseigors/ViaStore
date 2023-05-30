import 'package:estudo_de_caso/pages/BelezaPage.dart';
import 'package:estudo_de_caso/pages/CamaMesaBanhoPage.dart';
import 'package:estudo_de_caso/pages/DecorationPage.dart';
import 'package:estudo_de_caso/pages/HomePage.dart';
import 'package:estudo_de_caso/pages/LoginPage.dart';
import 'package:estudo_de_caso/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const RegisterPage(),
        '/cama': (context) => const CamaMesaBanho(),
        '/decoration': (context) => const DecorationPage(),
        '/beleza': (context) => const BelezaPage(),
      }

    );
  }}