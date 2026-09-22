import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MedicamentosApp());
}

class MedicamentosApp extends StatelessWidget {
  final Widget home;

  const MedicamentosApp({super.key, this.home = const HomeScreen()});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Medicamentos',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: home,
    );
  }
}

/* Esse código é responsável apenas por inicializar a aplicação e definir o tema
global. Dessa maneira, as regras e componentes da aplicação permanecem separados. */
