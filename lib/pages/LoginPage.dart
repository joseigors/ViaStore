
import 'package:estudo_de_caso/models/UserModel.dart';
import 'package:estudo_de_caso/pages/HomePage.dart';
import 'package:estudo_de_caso/widgets/CustomColor.dart';
import 'package:estudo_de_caso/widgets/CustomStyleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:scoped_model/scoped_model.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          padding: const EdgeInsets.all(16),
          child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                if (model.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  );
                }
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 45.0),
                        child: Image(
                            image: AssetImage("lib/assets/images/VS.jpg"),
                            height: 200,
                            width: 200),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text!.isEmpty || !text.contains('@')) {
                            return "Email Inválido!";
                          }
                        },
                        style: const TextStyle(color: Colors.black, fontSize: 13),
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "E-mail",
                            hintTextStr: "informe o seu e-mail"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passController,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6) {
                            return "Senha Inválida";
                          }
                        },
                        obscureText: true,
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "Senha",
                            hintTextStr: "informe sua Senha"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: const Text('Esqueceu a senha?'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 60,
                          width: 100,
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            color: CustomColor.redAcent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Acessar",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 58, 58, 58),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                login();
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          "ou",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Google,
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Google'),
                                  content: const Text('Google button pressed'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          "Ainda não possui uma conta?",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: TextButton(
                          child: const Text(
                            'Registre-se aqui!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cadastro');
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey[200],
                        child: const Text(
                          '© 2023 Sua Empresa. Todos os direitos reservados.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
  login()async {
    try{
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text);
      if (userCredential != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => HomePage(),
            )
        );
      }
    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuario não encontrado'),
              backgroundColor: Colors.redAccent,
            ),
        );
      } else if (e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sua senha está errada'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
