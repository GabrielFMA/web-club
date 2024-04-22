import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/register/register_client.dart';
import 'package:web_simclub/screen/register/register_partner.dart';
import 'package:web_simclub/screen/register/register_employee.dart';
import 'package:web_simclub/screen/register/register_plan.dart';
import 'package:web_simclub/store/auth.store.dart';
import 'package:web_simclub/store/client.store.dart';
import 'package:web_simclub/store/employee.store.dart';
import 'package:web_simclub/store/partner.store.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    final client = Provider.of<ClientStore>(context);
    final partner = Provider.of<PartnerStore>(context);
    final employee = Provider.of<EmployeeStore>(context);

    return Container(
      width: 300,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Exit Button
              buildMenuItem(
                text: store.getName(),
                icon: MdiIcons.exitToApp,
                color: Colors.white,
                onClick: () => showDialog(
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
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              if (store.getLevel() < 3)
                ExpansionTile(
                  iconColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.accountOutline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Cliente',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded ? MdiIcons.chevronUp : MdiIcons.chevronDown,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: buildMenuItem(
                        text: 'Registro de Cliente',
                        icon: MdiIcons.accountPlusOutline,
                        onClick: () {
                          client.restoreData();
                          partner.restoreData();
                          employee.restoreData();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterClient(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

              // Register Employee
              if (store.getLevel() < 2)
                buildMenuItem(
                  text: 'Registro de Funcionário',
                  icon: MdiIcons.badgeAccountHorizontalOutline,
                  onClick: () {
                    client.restoreData();
                    partner.restoreData();
                    employee.restoreData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterEmployee(),
                      ),
                    );
                  },
                ),

              // Register Partner
              if (store.getLevel() < 2)
                buildMenuItem(
                  text: 'Registro de Parceiro',
                  icon: MdiIcons.handshakeOutline,
                  onClick: () {
                    client.restoreData();
                    partner.restoreData();
                    employee.restoreData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPartner(),
                      ),
                    );
                  },
                ),
              if (store.getLevel() < 2)
                buildMenuItem(
                  text: 'Registro de Plano',
                  icon: MdiIcons.formSelect,
                  onClick: () {
                    client.restoreData();
                    partner.restoreData();
                    employee.restoreData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterPlan(),
                      ),
                    );
                  },
                ),

              // Dividing line
              const Divider(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  // Menu Controller
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    Color? color,
    VoidCallback? onClick,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: onClick,
    );
  }

  // Button controller
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
