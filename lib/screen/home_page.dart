import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/components/menu.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/auth/register.dart';
import 'package:web_simclub/store/auth.store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    return Scaffold(
      body: Row(
        children: [
          // Menu lateral fixo
          MenuWidget(),
          // Conteúdo principal
          Expanded(
            child: Container(
              color: Colors.green[200], // Cor de fundo do conteúdo principal
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
