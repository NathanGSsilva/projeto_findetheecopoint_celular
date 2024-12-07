// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projeto_findetheecopoint/home_page.dart';

class EcoPage extends StatefulWidget {
  const EcoPage({super.key});

  @override
  State<EcoPage> createState() => _EcoPageState();
}

class _EcoPageState extends State<EcoPage> {
  List<dynamic> ecopontos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    listaEcoponto();
  }

  Future<void> listaEcoponto() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.56.45.45/public/api/ecopontos'));

      if (response.statusCode == 200) {
        setState(() {
          ecopontos = json.decode(response.body);

          isLoading = false;
        });
      }
    } catch (e) {
      mostrarError('Erro: $e');
    }
  }

  void mostrarError(String mensagem) {
    setState(() {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find The EcoPoint"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 3, 180, 9),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ecopontos.length,
              itemBuilder: (context, index) {
                final ecoponto = ecopontos[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30), // Espaçamento opcional no topo

                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 28, 121, 32),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.2), // Cor da sombra com opacidade
                            offset: Offset(4,
                                4), // Deslocamento horizontal e vertical da sombra
                            blurRadius: 6, // Suavização da sombra
                            spreadRadius: 1, // Expansão da sombra
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    ecoponto['fotos'][0]['imagem'],
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200, // Limita a largura do texto
                                        child: Text(
                                          ecoponto['nome'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          softWrap:
                                              true, // Permite quebra de linha
                                           // Adiciona "..." caso o texto seja muito longo
                                        ),
                                      ),
Divider(),
                                      Text(
                                        ecoponto['endereco'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),

                                      SizedBox(
                                          height:
                                              5), // Espaçamento entre os textos

                                      Container(
                                        width:
                                            200, // Limita a largura para forçar a quebra de linha
                                        child: Text('Recicla: ${ecoponto['lixos']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
