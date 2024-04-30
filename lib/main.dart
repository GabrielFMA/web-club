// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/firebase_options.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/home_page.dart';
import 'package:web_simclub/store/auth/auth.store.dart';
import 'package:web_simclub/store/register/client/client.store.dart';
import 'package:web_simclub/store/register/client/dependents.store.dart';
import 'package:web_simclub/store/register/partner/partner.store.dart';
import 'package:web_simclub/store/register/employee/employee.store.dart';
import 'package:web_simclub/store/register/plan/plan.store.dart';
import 'package:web_simclub/store/sell/sell.store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Auth
        Provider<AuthStore>(create: (_) => AuthStore()),
        //Client
        Provider<ClientStore>(create: (_) => ClientStore()),
        Provider<DependentsStore>(create: (_) => DependentsStore()),
        //Employee
        Provider<EmployeeStore>(create: (_) => EmployeeStore()),
        //Partner
        Provider<PartnerStore>(create: (_) => PartnerStore()),
        //Plan
        Provider<PlanStore>(create: (_) => PlanStore()),
        //Sell
        Provider<SellStore>(create: (_) => SellStore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: Builder (
          builder: (context) {
            final auth = FirebaseAuth.instance;
            final currentUser = auth.currentUser;

            if (currentUser != null) {
              final store = Provider.of<AuthStore>(context);

              store.recoveryData(currentUser.uid);
              print('Usuário logado: ${currentUser.uid}');

              return const HomePage();
            } else {
              print('Sem usuario');
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}