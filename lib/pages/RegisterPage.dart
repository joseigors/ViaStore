import 'dart:html';
import 'dart:io';
import 'package:estudo_de_caso/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                          color: Colors.red),
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(width: 10,),
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
                    margin: const EdgeInsets.all(40),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: selectedImage == null
                            ? const AssetImage(
                            "lib/assets/images/person.png")
                            : XFile(selectedImage as String)
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
                ),

                //nome
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //sobrenome
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sobrenome',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                //Telefone
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Telefone',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'E-mail',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // botão de cadastro
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          'Cadastrar',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 220,),
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
          ),
        ),
      ),
    );
  }
}
