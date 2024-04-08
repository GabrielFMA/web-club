import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/auth/register.dart';
import 'package:web_simclub/store/auth.store.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Container(
            width: 300, // Largura do menu lateral
            color: Colors.green, // Cor de fundo do menu lateral
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: const Text(
                        'sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        store.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),

                    const Divider(color: Colors.white),
                    ListTile(
                      leading: const Icon(Icons.people, color: Colors.white),
                      title: const Text(
                        'Registro Cliente',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegistroScreen()));
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.admin_panel_settings,
                          color: Colors.white),
                      title: const Text(
                        'Registro Funcionario',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        // Lógica para ação da opção 2
                      },
                    ),
                    // Adicione mais opções conforme necessário

                  ],
                ),
              ),
            ),
          );
  }
}