import 'package:estudo_de_caso/pages/EditProfile.dart';
import 'package:estudo_de_caso/widgets/CustomColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            IconButton(
                icon:
                const Icon(Icons.arrow_circle_left, color: Colors.red),
                alignment: Alignment.topLeft,
                onPressed: () {}),

            const SizedBox(
              height: 10,
            ),
            Text(
              "Perfil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: 50,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(232, 248, 13, 33), Colors.white],
                  ),
                  //color: CustomColor.colorBackground,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: ListView(
                padding: EdgeInsets.all(50),
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Nome:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "José Igor Santos Oliveira",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Telefone:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "07999990000",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "igor.so@email.com",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Editar",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 58, 58, 58),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
