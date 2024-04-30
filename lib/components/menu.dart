// ignore_for_file: unnecessary_const, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/store/auth/auth.store.dart';
import 'package:web_simclub/store/register/client/client.store.dart';
import 'package:web_simclub/store/register/employee/employee.store.dart';
import 'package:web_simclub/store/register/partner/partner.store.dart';
import 'package:web_simclub/store/register/plan/plan.store.dart';
import 'package:web_simclub/store/sell/sell.store.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class MenuItemData {
  final String text;
  final IconData icon;
  final VoidCallback onClick;

  MenuItemData({
    required this.text,
    required this.icon,
    required this.onClick,
  });
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    final sell = Provider.of<SellStore>(context);
    final plan = Provider.of<PlanStore>(context);
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
                title: Text('Olá, ' + store.getName() + '!',
                    style: const TextStyle(color: Colors.white)),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Client
              if (store.getLevel() < 3)
                buildMenuDrawer(
                  context: context,
                  text: 'Clientes',
                  icon: MdiIcons.accountOutline,
                  menuItems: [
                    MenuItemData(
                      text: 'Cadastro',
                      icon: MdiIcons.notePlusOutline,
                      onClick: () {
                        client.restoreData();
                        Navigator.pushNamed(context, '/registrarcliente');
                      },
                    ),
                    MenuItemData(
                      text: 'Adicionar Dependentes',
                      icon: MdiIcons.accountMultiplePlusOutline,
                      onClick: () {
                        client.restoreData();
                        Navigator.pushNamed(context, '/adicionardependentes');
                      },
                    ),
                  ],
                ),

              // ExpansionTile for Employee
              if (store.getLevel() < 2)
                buildMenuDrawer(
                  context: context,
                  text: 'Funcionarios',
                  icon: MdiIcons.badgeAccountHorizontalOutline,
                  menuItems: [
                    MenuItemData(
                      text: 'Cadastro',
                      icon: MdiIcons.notePlusOutline,
                      onClick: () {
                        employee.restoreData();
                        Navigator.pushNamed(context, '/registrarfuncionario');
                      },
                    ),
                  ],
                ),

              // ExpansionTile for Partner
              if (store.getLevel() < 2)
                buildMenuDrawer(
                  context: context,
                  text: 'Parceiros',
                  icon: MdiIcons.handshakeOutline,
                  menuItems: [
                    MenuItemData(
                      text: 'Cadastro',
                      icon: MdiIcons.notePlusOutline,
                      onClick: () {
                        partner.restoreData();
                        Navigator.pushNamed(context, '/registrarparceiro');
                      },
                    ),
                  ],
                ),

              // ExpansionTile for Plans
              if (store.getLevel() < 2)
                buildMenuDrawer(
                  context: context,
                  text: 'Planos',
                  icon: MdiIcons.newspaperVariantMultipleOutline,
                  menuItems: [
                    MenuItemData(
                      text: 'Cadastro',
                      icon: MdiIcons.notePlusOutline,
                      onClick: () {
                        plan.restoreData();
                        Navigator.pushNamed(context, '/registrarplano');
                      },
                    ),
                  ],
                ),

              // ExpansionTile for Sells
              if (store.getLevel() < 3)
                buildMenuDrawer(
                  context: context,
                  text: 'Vendas e Orçamento',
                  icon: MdiIcons.networkPos,
                  menuItems: [
                    MenuItemData(
                      text: 'Venda',
                      icon: MdiIcons.clipboardPlusOutline,
                      onClick: () {
                        sell.restoreData();
                        Navigator.pushNamed(context, '/venda');
                      },
                    ),
                    MenuItemData(
                      text: 'Orçamento',
                      icon: MdiIcons.textBoxPlusOutline,
                      onClick: () {
                        sell.restoreData();
                        Navigator.pushNamed(context, '/orcamento');
                      },
                    ),
                  ],
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
                          Navigator.pushNamed(context, '/home');
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
    List<MenuItemData> menuItems = const [], // Optional menu items
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
        children: menuItems.map((item) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: buildMenuItem(
              text: item.text,
              icon: item.icon,
              onClick: item.onClick,
            ),
          );
        }).toList(),
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