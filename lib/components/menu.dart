import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/auth/register_client.dart';
import 'package:web_simclub/screen/auth/register_employee.dart';
import 'package:web_simclub/store/auth.store.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    Color getColor(bool verification) {
      return verification ? Colors.white : Colors.grey;
    }

    IconData getIcon(bool verification) {
      return verification ? Icons.admin_panel_settings : Icons.lock;
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
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Sair',
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistroScreen(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(getIcon(store.admin), color: getColor(store.admin)),
                title: Text(
                  'Registro Funcionario',
                  style: TextStyle(
                    color: getColor(store.admin),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  if (store.admin) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterEmployee(),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}