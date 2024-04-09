import 'package:flutter/material.dart';
import 'package:web_simclub/components/menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const MenuWidget(),
          Expanded(
            child: Container(
              color: Colors.green[200],
              child: const Center(
                child: Text('Conteúdo principal aqui'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}