import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  final String nome;
  final double qtdAgua;
  final OpcaoContagem opcaoEscolhida;

  const HomePage({
    super.key,
    required this.nome,
    required this.qtdAgua,
    required this.opcaoEscolhida,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double aguaConsumida = 0;

  int getMlPorUnidade() {
    switch (widget.opcaoEscolhida) {
      case OpcaoContagem.copo:
        return 250;
      case OpcaoContagem.garrafa:
        return 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
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
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                width: 270,
                height: 50,
                child: Text(
                  'Olá ${widget.nome}, sua meta diária é de ${widget.qtdAgua}L!',
                ),
                alignment: Alignment.center,
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
              ),
              Container(
                width: 300,
                height: 400,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/garrafa-vazia-sora.png',
                      height: 400,
                      width: 250,
                      fit: BoxFit.fill,
                    ),
                    ClipRect(
                      child: AnimatedAlign(
                        alignment: Alignment.bottomCenter,
                        heightFactor:
                            (widget.qtdAgua > 0)
                                ? (aguaConsumida / widget.qtdAgua).clamp(
                                  0.0,
                                  1.0,
                                )
                                : 0.0,
                        duration: Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        child: Image.asset(
                          'assets/images/garrafa-cheia-sora.png',
                          height: 395,
                          width: 276,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 270,
                height: 50,
                child: Text('Voce já bebeu ${aguaConsumida}L hoje!'),
                alignment: Alignment.center,
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
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        aguaConsumida += getMlPorUnidade() / 1000;
                        if (aguaConsumida >= widget.qtdAgua) {
                          aguaConsumida = widget.qtdAgua;
                        }
                      });
                    },
                    child: Text('Adicionar ${getMlPorUnidade()} ml'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        aguaConsumida = 0;
                      });
                    },
                    child: const Text('Resetar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
