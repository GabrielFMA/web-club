// ignore_for_file: unnecessary_const

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

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContent();
  }
}

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  bool _isClientExpanded = false;
  bool _isEmployeeExpanded = false;
  bool _isPartnerExpanded = false;
  bool _isPlansExpanded = false;
  bool _isSellsExpanded = false;

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
              // Exit Button
              buildMenuItem(
                text: store.getName(),
                icon: MdiIcons.accountBoxOutline,
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterClient(),
                    ),
                  );
                },
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Client
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
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
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: _isClientExpanded
                        ? Icon(
                            MdiIcons.chevronUp,
                            key: const Key('up'),
                            color: Colors.white,
                          )
                        : Icon(
                            MdiIcons.chevronDown,
                            key: const Key('down'),
                            color: Colors.white,
                          ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isClientExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: buildMenuItem(
                        text: 'Cadastro',
                        icon: MdiIcons.notePlusOutline,
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
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Employee
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.badgeAccountHorizontalOutline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Funcionarios',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: _isEmployeeExpanded
                        ? Icon(
                            MdiIcons.chevronUp,
                            key: const Key('up'),
                            color: Colors.white,
                          )
                        : Icon(
                            MdiIcons.chevronDown,
                            key: const Key('down'),
                            color: Colors.white,
                          ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isEmployeeExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: buildMenuItem(
                        text: 'Cadastro',
                        icon: MdiIcons.notePlusOutline,
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
                    ),
                  ],
                ),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Partner
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.handshakeOutline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Parceiros',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: _isPartnerExpanded
                        ? Icon(
                            MdiIcons.chevronUp,
                            key: const Key('up'),
                            color: Colors.white,
                          )
                        : Icon(
                            MdiIcons.chevronDown,
                            key: const Key('down'),
                            color: Colors.white,
                          ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isPartnerExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: buildMenuItem(
                        text: 'Cadastro',
                        icon: MdiIcons.notePlusOutline,
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
                    ),
                  ],
                ),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Plans
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.newspaperVariantMultipleOutline,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Planos',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: _isPlansExpanded
                        ? Icon(
                            MdiIcons.chevronUp,
                            key: const Key('up'),
                            color: Colors.white,
                          )
                        : Icon(
                            MdiIcons.chevronDown,
                            key: const Key('down'),
                            color: Colors.white,
                          ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isPlansExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: buildMenuItem(
                        text: 'Cadastro',
                        icon: MdiIcons.notePlusOutline,
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
                    ),
                  ],
                ),
              ),

              // Dividing line
              const Divider(color: Colors.white),

              // ExpansionTile for Sells
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.networkPos,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Vendas',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: _isSellsExpanded
                        ? Icon(
                            MdiIcons.chevronUp,
                            key: const Key('up'),
                            color: Colors.white,
                          )
                        : Icon(
                            MdiIcons.chevronDown,
                            key: const Key('down'),
                            color: Colors.white,
                          ),
                  ),
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      _isSellsExpanded = isExpanded;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: buildMenuItem(
                        text: 'Cadastro',
                        icon: MdiIcons.notePlusOutline,
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
                    ),
                  ],
                ),
              ),
              // Dividing line
              const Divider(color: Colors.white),

              // Final space
              const Spacer(),

              // Dividing line
              const Divider(color: Colors.white),

              SizedBox(
                height: 50, // Defina a altura desejada aqui
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: const Border(
                            right: BorderSide(color: Colors.white38, width: 2, ),
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
