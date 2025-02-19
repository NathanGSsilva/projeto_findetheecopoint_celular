import 'package:flutter/material.dart';
import 'ecopontos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find The EcoPoint",
          style:
              TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.green[800]),
      ),
      backgroundColor: Colors.green.shade50,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Nathan", style: TextStyle(fontSize: 18)),
              accountEmail: Text("nathan@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Colors.green),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(leading: Icon(Icons.login), title: Text("Login")),
            ListTile(leading: Icon(Icons.list), title: Text("Serviços")),
            ListTile(leading: Icon(Icons.help), title: Text("Dúvidas")),
            Divider(),
            ListTile(
                leading: Icon(Icons.info),
                title: Text("Sobre a Find The EcoPoint")),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade900, Colors.green.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Descubra os EcoPontos próximos a você!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                        blurRadius: 3),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ],
                ),
                child: Column(
                  children: [
                    Text("Escolha a categoria do lixo:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category)),
                      items: ["Plástico", "Vidro", "Papel", "Metal"]
                          .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedCategory = value),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite seu CEP",
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EcoPage()));
                      },
                      child: Text("Buscar", style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 18,
                            ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child:
                      Text("Nossos Parceiros!", style: _sectionTitleStyle())),
              _buildCenteredGrid([
                "assets/trata-entulho.png",
                "assets/vm-coleta.png",
                "assets/mult-uvr.png"
              ]),
              Center(
                  child: Text("Nossas Redes Sociais!",
                      style: _sectionTitleStyle())),
              _buildCenteredGrid([
                "assets/trata-entulho.png",
                "assets/vm-coleta.png",
                "assets/mult-uvr.png"
              ]),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenteredGrid(List<String> images) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: images.map((img) => _buildImageCard(img)).toList(),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: 80, height: 80),
        SizedBox(height: 5),
        Text("Parceiro", style: TextStyle(fontSize: 12, color: Colors.white)),
      ],
    );
  }

  TextStyle _sectionTitleStyle() {
    return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(2, 2),
            blurRadius: 3)
      ],
    );
  }
}
