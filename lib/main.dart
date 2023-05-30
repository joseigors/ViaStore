import 'package:estudo_de_caso/pages/BelezaPage.dart';
import 'package:estudo_de_caso/pages/CamaMesaBanhoPage.dart';
import 'package:estudo_de_caso/pages/DecorationPage.dart';
import 'package:estudo_de_caso/pages/HomePage.dart';
import 'package:estudo_de_caso/pages/LoginPage.dart';
import 'package:estudo_de_caso/pages/Profile.dart';
import 'package:estudo_de_caso/pages/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:estudo_de_caso/firebase_options.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:estudo_de_caso/models/UserModel.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        initialRoute: '/login',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/cadastro': (context) => const RegisterPage(),
          '/cama': (context) => const CamaMesaBanho(),
          '/decoration': (context) => const DecorationPage(),
          '/beleza': (context) => const BelezaPage(),
          '/perfil': (context)  => const ProfilePage(),
        }

      ),
    );
  }}