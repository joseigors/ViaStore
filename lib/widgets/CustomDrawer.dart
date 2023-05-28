import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(232, 182, 0, 17), Colors.white30],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight)),
    );
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                accountName: Text("Jhon"),
                accountEmail: Text(" Jhon@gmail.com "),
                currentAccountPicture: CircleAvatar(

                ),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text("Categorias"),
                onTap: () {

                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Minha conta"),
                onTap: () {
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("Carrinho"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),

              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Sair"),
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                  //Navegar para outra página
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}