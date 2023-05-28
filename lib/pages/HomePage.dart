import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 25,
            ),
            AppBar(
              backgroundColor: const Color.fromARGB(232, 248, 13, 33),
              title: Text('VIVA STORE'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {

                  },
                )
              ],
                centerTitle: true,
            ),
            SizedBox(height: 25),

            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.red,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Fundo - Imagem ou Vídeo
                  Image.network(
                    'https://br.pinterest.com/pin/314970567673023959/',
                    fit: BoxFit.cover,),
                  // Texto

                ],
              ),
              ),

            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.deepOrangeAccent,
            ),

            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.45,
              color: Colors.white60,
            ),

          ],
        ),
      ),
      ),
    );

  }

}
