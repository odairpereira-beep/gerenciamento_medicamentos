import 'package:flutter/material.dart';

import '../models/medicamento.dart';

class CadastroMedicamentoScreen extends StatefulWidget {
  const CadastroMedicamentoScreen({super.key});

  @override
  State<CadastroMedicamentoScreen> createState() =>
      _CadastroMedicamentoScreenState();
}

class _CadastroMedicamentoScreenState extends State<CadastroMedicamentoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();

  final _dosagemController = TextEditingController();

  final _horarioController = TextEditingController();

  final _observacaoController = TextEditingController();

  String _frequencia = 'Diariamente';

  @override
  void dispose() {
    _nomeController.dispose();
    _dosagemController.dispose();
    _horarioController.dispose();
    _observacaoController.dispose();

    super.dispose();
  }

  Future<void> _selecionarHorario() async {
    final horario = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (horario != null) {
      setState(() {
        _horarioController.text = horario.format(context);
      });
    }
  }

  void _salvar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final medicamento = Medicamento(
      id: DateTime.now().millisecondsSinceEpoch.toString(),

      nome: _nomeController.text.trim(),

      dosagem: _dosagemController.text.trim(),

      horario: _horarioController.text.trim(),

      frequencia: _frequencia,

      observacao: _observacaoController.text.trim(),
    );

    Navigator.pop(context, medicamento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Medicamento')),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const Text(
                  'Informações do medicamento',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                TextFormField(
                  controller: _nomeController,

                  decoration: const InputDecoration(
                    labelText: 'Nome do medicamento',
                    prefixIcon: Icon(Icons.medication),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o nome do medicamento.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _dosagemController,

                  decoration: const InputDecoration(
                    labelText: 'Dosagem',
                    hintText: 'Ex.: 500 mg',
                    prefixIcon: Icon(Icons.science_outlined),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a dosagem.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: _frequencia,

                  decoration: const InputDecoration(
                    labelText: 'Frequência',
                    prefixIcon: Icon(Icons.repeat),
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Diariamente',
                      child: Text('Diariamente'),
                    ),
                    DropdownMenuItem(
                      value: 'A cada 8 horas',
                      child: Text('A cada 8 horas'),
                    ),
                    DropdownMenuItem(
                      value: 'A cada 12 horas',
                      child: Text('A cada 12 horas'),
                    ),
                    DropdownMenuItem(
                      value: 'Semanalmente',
                      child: Text('Semanalmente'),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _frequencia = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _horarioController,

                  readOnly: true,

                  onTap: _selecionarHorario,

                  decoration: const InputDecoration(
                    labelText: 'Horário',
                    hintText: 'Selecione o horário',
                    prefixIcon: Icon(Icons.access_time),
                    suffixIcon: Icon(Icons.schedule),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o horário.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _observacaoController,

                  maxLines: 4,

                  decoration: const InputDecoration(
                    labelText: 'Observação',
                    hintText: 'Digite uma observação, se necessário.',
                    prefixIcon: Icon(Icons.notes),
                  ),
                ),

                const SizedBox(height: 30),

                FilledButton.icon(
                  onPressed: _salvar,

                  icon: const Icon(Icons.save),

                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text('Salvar medicamento'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* Foi utilizado um formulário estruturado e validado para realizar o cadastro dos
medicamentos. Essa decisão foi baseada na necessidade de garantir que as informações
essenciais para o gerenciamento do tratamento sejam preenchidas corretamente pelo
usuário antes que o medicamento seja registrado na aplicação. */
