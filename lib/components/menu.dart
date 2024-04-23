// ignore_for_file: unnecessary_const, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/client/register_client.dart';
import 'package:web_simclub/screen/partner/register_partner.dart';
import 'package:web_simclub/screen/employee/register_employee.dart';
import 'package:web_simclub/screen/plan/register_plan.dart';
import 'package:web_simclub/store/auth.store.dart';
import 'package:web_simclub/store/client.store.dart';
import 'package:web_simclub/store/employee.store.dart';
import 'package:web_simclub/store/partner.store.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    final client = Provider.of<ClientStore>(context);
    final partner = Provider.of<PartnerStore>(context);
    final employee = Provider.of<EmployeeStore>(context);

    return Container(
      width: 320,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Info Button
              ListTile(
                title: Text('Olá, ' + store.getName(),
                    style: const TextStyle(color: Colors.white)),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Client
              buildMenuDrawer(
                context: context,
                text: 'Cliente',
                text2: 'Cadastro',
                icon: MdiIcons.accountOutline,
                icon2: MdiIcons.notePlusOutline,
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

              // ExpansionTile for Employee
              buildMenuDrawer(
                context: context,
                text: 'Funcionarios',
                text2: 'Cadastro',
                icon: MdiIcons.badgeAccountHorizontalOutline,
                icon2: MdiIcons.notePlusOutline,
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

              // ExpansionTile for Partner
              buildMenuDrawer(
                context: context,
                text: 'Parceiros',
                text2: 'Cadastro',
                icon: MdiIcons.handshakeOutline,
                icon2: MdiIcons.notePlusOutline,
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

              // ExpansionTile for Plans
              buildMenuDrawer(
                context: context,
                text: 'Planos',
                text2: 'Cadastro',
                icon: MdiIcons.newspaperVariantMultipleOutline,
                icon2: MdiIcons.notePlusOutline,
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

              // ExpansionTile for Sells
              buildMenuDrawer(
                context: context,
                text: 'Vendas',
                text2: 'Cadastro',
                icon: MdiIcons.networkPos,
                icon2: MdiIcons.notePlusOutline,
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

              // Final space
              const Spacer(),

              // Exit/User
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: BorderSide(
                              color: Colors.white38,
                              width: 2,
                            ),
                          ),
                        ),
                        child: buildMenuItem(
                          text: ' Logout',
                          icon: MdiIcons.exitToApp,
                          onClick: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Sair da conta'),
                                  content:
                                      const Text('Tem certeza que quer sair?'),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buttonDefault(
                                          text: 'SIM',
                                          onClick: () {
                                            store.signOut();
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen(),
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
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: buildMenuItem(
                        text: 'Usuário',
                        icon: MdiIcons.badgeAccountOutline,
                        onClick: () {
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuDrawer({
    required BuildContext context,
    required String text,
    required IconData icon,
    required String text2,
    required IconData icon2,
    required VoidCallback onClick,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: buildMenuItem(
              text: text2,
              icon: icon2,
              onClick: onClick,
            ),
          ),
        ],
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
