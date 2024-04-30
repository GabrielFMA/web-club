import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/firebase_options.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/home_page.dart';
import 'package:web_simclub/screen/register/client/add_dependents.dart';
import 'package:web_simclub/screen/register/client/register_client.dart';
import 'package:web_simclub/screen/register/employee/register_employee.dart';
import 'package:web_simclub/screen/register/partner/register_exam.dart';
import 'package:web_simclub/screen/register/partner/register_partner.dart';
import 'package:web_simclub/screen/register/plan/register_plan.dart';
import 'package:web_simclub/screen/sell/budget_sell.dart';
import 'package:web_simclub/screen/sell/gerenate_sales.dart';
import 'package:web_simclub/store/auth/auth.store.dart';
import 'package:web_simclub/store/register/client/client.store.dart';
import 'package:web_simclub/store/register/client/dependents.store.dart';
import 'package:web_simclub/store/register/employee/employee.store.dart';
import 'package:web_simclub/store/register/partner/partner.store.dart';
import 'package:web_simclub/store/register/plan/plan.store.dart';
import 'package:web_simclub/store/sell/sell.store.dart';

final auth = FirebaseAuth.instance;
final currentUser = auth.currentUser;

void main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
        routes: currentUser?.email != null
            ? {
                '/login': (_) => const LoginScreen(),
                '/home': (_) => const HomePage(),
                '/registrarcliente': (_) => const RegisterClient(),
                '/adicionardependentes': (_) => const AddDependents(),
                '/registrarfuncionario': (_) => const RegisterEmployee(),
                '/registrarparceiro': (_) => const RegisterPartner(),
                '/registrarparceiro/registrarconsulta': (_) =>
                    const RegisterExam(),
                '/registrarplano': (_) => const RegisterPlan(),
                '/venda': (_) => const GerenateSales(),
                '/orcamento': (_) => const BudgetSell(),
              }
            : {
                '/login': (_) => const LoginScreen(),
              },
        home: const AuthChecker(),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return FutureBuilder<User?>(
      future: authStore.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            final currentUser = snapshot.data!;
            authStore.recoveryData(currentUser.uid);
            print('Usuário logado: ${currentUser.uid}');
            return const HomePage();
          } else {
            print('Sem usuário');
            return const LoginScreen();
          }
        }
      },
    );
  }
}
