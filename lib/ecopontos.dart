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
        await http.get(Uri.parse('http://10.56.46.43/api/ecopontos/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // 🔍 Verifique se a API está enviando imagens corretamente

      setState(() {
        ecopontos = data;
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
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Find The EcoPoint"),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade900, Colors.green.shade400], // Gradiente verde
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: isLoading
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
                            color: Colors.black.withOpacity(0.2), 
                            offset: Offset(4, 4),
                            blurRadius: 6, 
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    ecoponto['nome'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
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
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Recicla: ${ecoponto['lixos']}',
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
                        ],
                      ),
                    ),
                  ],
                );
              }),
    ),
  );
}
}
