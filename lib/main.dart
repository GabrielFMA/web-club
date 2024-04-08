import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/firebase_options.dart';
import 'package:web_simclub/screen/auth/login.dart';
import 'package:web_simclub/screen/home_page.dart';
import 'package:web_simclub/store/auth.store.dart';
import 'package:web_simclub/store/client.store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => AuthStore()),
        Provider<ClientStore>(create: (_) => ClientStore())
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

              store.recuperacaoDados(currentUser.uid);
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
