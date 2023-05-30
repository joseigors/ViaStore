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
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(
              height: 20,
            ),
            const Text("Categorias",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),

                Flexible(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/baner.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(bottom: 25, top: 25),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(onPressed: (){},
                        child: const Text('Roupas',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/cama.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(bottom: 25, top: 25),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(onPressed: (){},
                        child: const Text('Cama, Mesa e Banho',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/Decoracao.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(bottom: 25, top: 25),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(onPressed: (){},
                        child: const Text('Decoração',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/beleza.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(bottom: 25, top: 25),
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(onPressed: (){},
                        child: const Text('Beleza',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15,)

              ],
            ),
            const SizedBox(height: 20),

            Text('Mais vendidos:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
            ),),
            const SizedBox(height: 20),

            Container(
              width: 450,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(232, 248, 13, 33), Colors.black12],
                  ),
                  //color: CustomColor.colorBackground,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: ListView(
                padding: EdgeInsets.all(50),
                children:  [
                   Column(
                    children: [
                      Column(
                        children:  [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assets/images/cardigan.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.black
                            ),

                          ),
                          SizedBox(height: 20),
                          const Text('Cardigan Midi Canelado ', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),

                          ),
                          const Text('55,90 ', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),

                          ),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assets/images/casaco.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.black
                            ),

                          ),
                          SizedBox(height: 20),
                          const Text('Blusa De Frio Lillo E Stitch', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),

                          ),
                          const Text('190,90 ', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),

                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),

                ],
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

      ),

      ),
    );

  }

}
