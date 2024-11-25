// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                ''' Descubra os EcoPontos
       próximos a você!''',
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
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: 330,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 138, 23),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Escolha a categoria do lixo:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Digite uma categoria...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20), // Espaçamento entre campos
                  Center(
                    child: Text(
                      "Digite seu CEP",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Exe: 00.000-000",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 10), // Espaçamento antes do botão

                  Align(
                    alignment: Alignment
                        .bottomRight, // Garante o alinhamento do botão no fim
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Buscar"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(
                                255, 0, 109, 0)), // Cor de fundo
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Cor do texto
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15), // Tamanho interno
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Nossos Parceiros!",
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
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: 330,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 138, 23),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                    Image.asset(
                      "assets/trata-entulho.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "Primeiro Paceiro  ",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  Column(children: [
                    Image.asset(
                      "assets/vm-coleta.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "Primeiro Paceiro  ",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  Column(children: [
                    Image.asset(
                      "assets/mult-uvr.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "Primeiro Paceiro  ",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  
                ],
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Nossas Redes Sociais!",
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
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: 330,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 138, 23),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                    Image.asset(
                      "assets/trata-entulho.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  SizedBox(
                    width: 30,
                  ),

                  Column(children: [
                    Image.asset(
                      "assets/vm-coleta.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "INSTAGRAM",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  SizedBox(
                    width: 30,
                  ),

                  Column(children: [
                    Image.asset(
                      "assets/mult-uvr.png", // Caminho da imagem
                      width: 60, // Largura da imagem
                      height: 60, // Altura da imagem
                    ),
                    Text(
                      "TIK TOK",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ]),

                  
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
