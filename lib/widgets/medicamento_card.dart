import 'package:flutter/material.dart';

import '../models/medicamento.dart';

class MedicamentoCard extends StatelessWidget {
  final Medicamento medicamento;
  final VoidCallback onDelete;

  const MedicamentoCard({
    super.key,
    required this.medicamento,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CircleAvatar(child: const Icon(Icons.medication_outlined)),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    medicamento.nome,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text('Dosagem: ${medicamento.dosagem}'),

                  Text('Horário: ${medicamento.horario}'),

                  Text('Frequência: ${medicamento.frequencia}'),

                  if (medicamento.observacao.isNotEmpty)
                    Text(
                      'Observação: '
                      '${medicamento.observacao}',
                    ),
                ],
              ),
            ),

            IconButton(
              tooltip: 'Excluir medicamento',
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
/* O cartão foi transformado em um componente independente. Isso evita repetição
de código e permite reutilizar o mesmo componente em diferentes telas. */
