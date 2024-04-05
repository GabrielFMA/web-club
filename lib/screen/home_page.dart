import 'package:flutter/material.dart';
import 'package:web_simclub/screen/auth/register.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu lateral fixo
          Container(
            width: 200, // Largura do menu lateral
            color: Colors.grey[200], // Cor de fundo do menu lateral
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text('Registro Cliente'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegistroScreen()));
                  },
                ),
                ListTile(
                  title: Text('Registro Funcionario'),
                  onTap: () {
                    // Lógica para ação da opção 2
                  },
                ),
                // Adicione mais opções conforme necessário
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Container(
              color: Colors.white, // Cor de fundo do conteúdo principal
              child: Center(
                child: Text('Conteúdo principal aqui'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
