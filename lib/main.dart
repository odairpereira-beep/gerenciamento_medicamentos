import 'package:flutter/material.dart';
import 'package:gerenciamento_medicamentos/screens/cadastro_medicamento_screen.dart';

void main() {
  runApp(const MedicamentosApp());
}

class MedicamentosApp extends StatelessWidget {
  const MedicamentosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meus Medicamentos',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CadastroMedicamentoScreen(),
    );
  }
}

/* Esse código é responsável apenas por inicializar a aplicação e definir o tema
global. Dessa maneira, as regras e componentes da aplicação permanecem separados. */
