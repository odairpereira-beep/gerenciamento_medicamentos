import 'package:flutter/material.dart';

import '../models/medicamento.dart';
import '../services/medicamento_service.dart';
import '../widgets/medicamento_card.dart';
import 'cadastro_medicamento_screen.dart';

class HomeScreen extends StatefulWidget {
  final Stream<List<Medicamento>>? medicamentosStream;

  const HomeScreen({super.key, this.medicamentosStream});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _cadastrarMedicamento() async {
    final medicamento = await Navigator.push<Medicamento>(
      context,
      MaterialPageRoute(builder: (_) => const CadastroMedicamentoScreen()),
    );

    if (medicamento == null) return;

    try {
      await MedicamentoService.adicionar(medicamento);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medicamento cadastrado com sucesso.')),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar medicamento: $e')),
      );
    }
  }

  Future<void> _excluirMedicamento(String id) async {
    try {
      await MedicamentoService.remover(id);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medicamento removido com sucesso.')),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao remover medicamento: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Medicamentos'), centerTitle: true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;

          final padding = largura < 600
              ? 16.0
              : largura < 1000
              ? 32.0
              : 80.0;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: StreamBuilder<List<Medicamento>>(
                  stream:
                      widget.medicamentosStream ?? MedicamentoService.listar(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Erro ao carregar medicamentos:\n${snapshot.error}',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final medicamentos = snapshot.data ?? [];

                    if (medicamentos.isEmpty) {
                      return _estadoVazio();
                    }

                    return ListView.builder(
                      itemCount: medicamentos.length,
                      itemBuilder: (context, index) {
                        final medicamento = medicamentos[index];

                        return MedicamentoCard(
                          medicamento: medicamento,
                          onDelete: () => _excluirMedicamento(medicamento.id),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _cadastrarMedicamento,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar medicamento'),
      ),
    );
  }

  Widget _estadoVazio() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),
          const Text(
            'Nenhum medicamento cadastrado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cadastre um medicamento para começar '
            'a organizar seus horários.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          FilledButton.icon(
            onPressed: _cadastrarMedicamento,
            icon: const Icon(Icons.add),
            label: const Text('Cadastrar medicamento'),
          ),
        ],
      ),
    );
  }
}

/* A tela principal da aplicação tem como objetivo facilitar a organização e acesso
às informações de tratamento. A tela foi desenvolvida com Flutter, usando layouts
responsivos para adaptar-se a diferentes tamanhos de tela. */
