// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

class EcoPage extends StatefulWidget {
  const EcoPage({super.key});

  @override
  State<EcoPage> createState() => _EcoPageState();
}

class _EcoPageState extends State<EcoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find The EcoPoint"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 3, 180, 9),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  "Olá, Nathan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Serviços"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Dúvidas"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre a Find The EcoPoint"),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30), // Espaçamento opcional no topo

            Center(
              child: Text(
                "Resultado",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5), // Cor da sombra
                      offset:
                          Offset(2, 2), // Deslocamento horizontal e vertical
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),


            Container(
              height: 700,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 121, 32),
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                ),

              child: Row(
                children: [
                  Container(
                    child:
                    Row(
                      children: [
                      Image.asset(
                        "assets/vm-coleta.png", // Caminho da imagem
                        width: 80, // Largura da imagem
                        height: 80, // Altura da imagem
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Foto", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Nome", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Rua", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Classificação", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),

                      ]

                    ) 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
