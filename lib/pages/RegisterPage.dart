
import 'package:estudo_de_caso/models/UserModel.dart';
import 'package:estudo_de_caso/pages/CheckPage.dart';
import 'package:estudo_de_caso/pages/LoginPage.dart';
import 'package:estudo_de_caso/widgets/CustomColor.dart';
import 'package:estudo_de_caso/widgets/CustomStyleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  XFile? selectedImage;

  Future getImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      selectedImage = XFile(image!.path ); // won't have any error now
    });
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _SobrenomeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<
      ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(
                          height: 20
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_circle_left,
                              color: Colors.red,
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          const Text(
                            "Criar Nova Conta",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(40),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: selectedImage == null
                                  ? const AssetImage(
                                  "lib/assets/images/person.png")
                                  : XFile(selectedImage! as String)
                              as ImageProvider, // <-- this is where the error is
                            ),
                          ),
                        ),
                        onTap: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((file) {
                            if (file == null) {
                              return;
                            }
                            setState(() {
                              selectedImage = XFile(file.path);
                            });
                          });
                        },
                      ),const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofocus: false,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text!.isEmpty ) {
                            return "Digite um Email";
                          }
                        },
                        style: const TextStyle(color: Colors.black, fontSize: 13),
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "email",
                            hintTextStr: "informe o seu email"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      TextFormField(
                        autofocus: false,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: (text) {
                          if (text!.isEmpty ) {
                            return "Digite um nome";
                          }
                        },
                        style: const TextStyle(color: Colors.black, fontSize: 13),
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "Nome",
                            hintTextStr: "informe o seu nome"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _SobrenomeController,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6) {
                            return "Digite seu Sobrenome";
                          }
                        },
                        obscureText: false,
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "Sobrenome",
                            hintTextStr: "informe seu Sobrenome"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _phoneController,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6) {
                            return "Digite seu número";
                          }
                        },
                        obscureText: false,
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "Phone",
                            hintTextStr: "informe seu Número"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _passController,
                        validator: (text) {
                          if (text!.isEmpty || text.length < 6) {
                            return "Digite sua senha";
                          }
                        },
                        obscureText: true,
                        decoration: CustomStyleButton.textFieldStyle(
                            labelTextStr: "Senha",
                            hintTextStr: "informe sua senha"),
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
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 58, 58, 58),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                signUp();
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

  signUp()async {
    _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text)
        .then((UserCredential userCredential) {
          userCredential.user!.updateDisplayName(_nameController.text); 
    }).catchError((FirebaseAuthException firebaseAuthException){});
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CheckPage(),),
    (route) => false);

  }
  _onSuccess(){

  }
  _onFail(){
    scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text("Falha no login"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
}
