import 'package:flutter/material.dart';
import 'home.dart';

enum OpcaoContagem { copo, garrafa }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  OpcaoContagem _opcaoEscolhida = OpcaoContagem.copo;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 122, 255),
              Color.fromARGB(255, 94, 198, 245),
            ],
          ),
        ),

        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'SALVE MEU RIM',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 61, 60, 60),
                        offset: Offset(4, 10),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 300,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Insira seu nome: ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(10, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text('Nome', style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Insira sua Idade: ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(10, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: idadeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'Idade',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Insira seu peso (Kg):',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(10, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: pesoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text('Peso', style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Controle de consumo de Água:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    RadioListTile<OpcaoContagem>(
                      title: const Text('Copo (200ml)'),
                      value: OpcaoContagem.copo,
                      groupValue: _opcaoEscolhida,
                      onChanged: (OpcaoContagem? value) {
                        setState(() {
                          _opcaoEscolhida = value!;
                        });
                      },
                    ),
                    RadioListTile<OpcaoContagem>(
                      title: const Text('Garrafa (500ml)'),
                      value: OpcaoContagem.garrafa,
                      groupValue: _opcaoEscolhida,
                      onChanged: (OpcaoContagem? value) {
                        setState(() {
                          _opcaoEscolhida = value!;
                        });
                      },
                    ),

                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        String nome = nomeController.text;
                        int idade = int.parse(idadeController.text);
                        double peso = double.parse(pesoController.text);
                        double qtdAgua = (peso * 35) / 1000;

                        print('Nome:$nome');
                        print('Idade:$idade');
                        print('Peso: $peso');
                        print('Qntd Agua: $qtdAgua L');
                        print('Controle de agua : $_opcaoEscolhida');

                        if (nomeController.text.isEmpty ||
                            idadeController.text.isEmpty ||
                            pesoController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Preencha todos os campos')),
                          );
                          return;
                        }
                        try {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HomePage(
                                    nome: nome,
                                    qtdAgua: qtdAgua,
                                    opcaoEscolhida: _opcaoEscolhida,
                                  ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error ao navegar!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Colors.blueAccent.shade400,
                        foregroundColor: Colors.white,
                        minimumSize: Size(150, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text('Começar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
