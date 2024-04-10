import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/auth/register_client.dart';
import 'package:web_simclub/screen/auth/register_employee.dart';
import 'package:web_simclub/store/auth.store.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    Color getColor(int verification) {
      return verification < 2 ? Colors.white : Colors.grey;
    }

    IconData getIcon(int verification) {
      return verification < 2 ? Icons.admin_panel_settings : Icons.lock;
    }

    return Container(
      width: 300,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildMenuItem(
                text: 'Sair',
                icon: Icons.logout,
                color: Colors.white,
                onClick: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Sair da conta'),
                        content: const Text('Tem certeza que quer sair?'),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonDefault(
                                text: 'SIM',
                                onClick: () {
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
                              buttonDefault(
                                text: 'NÃO',
                                onClick: () {
                                  Navigator.pop(
                                      context); // Fechar o AlertDialog
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                },
              ),
              const Divider(color: Colors.white),
              buildMenuItem(
                text: 'Registro Cliente',
                icon: Icons.people,
                color: Colors.white,
                onClick: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterClient(),
                    ),
                  ),
                },
              ),
              buildMenuItem(
                text: 'Registro Funcionário',
                icon: getIcon(store.level),
                color:  getColor(store.level),
                onClick: () => {
                  if (store.level < 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterEmployee(),
                    ),
                  )}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildMenuItem(
      {required String text, required IconData icon, required Color color, VoidCallback? onClick}) {

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClick,
    );
  }

  Widget buttonDefault({required String text, VoidCallback? onClick}) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
