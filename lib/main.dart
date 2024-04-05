import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_simclub/firebase_options.dart';
import 'package:web_simclub/pages/auth/Login.dart';
import 'package:web_simclub/store/auth.store.dart';

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
      providers: [Provider<AuthStore>(create: (_) => AuthStore())],
      child: const MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
