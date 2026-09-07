import 'package:flutter/material.dart';

import '../models/medicamento.dart';
import '../services/medicamento_service.dart';
import 'cadastro_medicamento_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _abrirCadastro() async {
    final medicamento = await Navigator.push<Medicamento>(
      context,
      MaterialPageRoute(builder: (_) => const CadastroMedicamentoScreen()),
    );

    if (medicamento != null) {
      setState(() {
        MedicamentoService.adicionar(medicamento);
      });
    }
  }

  void _removerMedicamento(String id) {
    setState(() {
      MedicamentoService.remover(id);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Medicamento removido.')));
  }

  @override
  Widget build(BuildContext context) {
    final medicamentos = MedicamentoService.listar();

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Medicamentos'), centerTitle: true),

      body: medicamentos.isEmpty
          ? _buildEstadoVazio()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: medicamentos.length,
              itemBuilder: (context, index) {
                final medicamento = medicamentos[index];

                return _buildMedicamentoCard(medicamento);
              },
            ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _abrirCadastro,
        icon: const Icon(Icons.add),
        label: const Text('Adicionar'),
      ),
    );
  }

  Widget _buildEstadoVazio() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
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
              'Cadastre seu primeiro medicamento '
              'para começar a organizar seus horários.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            FilledButton.icon(
              onPressed: _abrirCadastro,
              icon: const Icon(Icons.add),
              label: const Text('Cadastrar medicamento'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicamentoCard(Medicamento medicamento) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(child: const Icon(Icons.medication)),

        title: Text(
          medicamento.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '${medicamento.dosagem}\n'
            '${medicamento.frequencia} • '
            '${medicamento.horario}',
          ),
        ),

        isThreeLine: true,

        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            _removerMedicamento(medicamento.id);
          },
        ),
      ),
    );
  }
}

/* A tela principal da aplicação tem como objetivo facilitar a organização e acesso
às informações de tratamento. A tela foi desenvolvida com Flutter, usando layouts
responsivos para adaptar-se a diferentes tamanhos de tela. */
