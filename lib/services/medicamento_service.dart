import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/medicamento.dart';

class MedicamentoService {
  static final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('medicamentos');

  static Stream<List<Medicamento>> listar() {
    return _collection.orderBy('nome').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();

        return Medicamento(
          id: doc.id,
          nome: data['nome'] ?? '',
          dosagem: data['dosagem'] ?? '',
          horario: data['horario'] ?? '',
          frequencia: data['frequencia'] ?? '',
          observacao: data['observacao'] ?? '',
        );
      }).toList();
    });
  }

  static Future<void> adicionar(Medicamento medicamento) async {
    await _collection.doc(medicamento.id).set({
      'nome': medicamento.nome,
      'dosagem': medicamento.dosagem,
      'horario': medicamento.horario,
      'frequencia': medicamento.frequencia,
      'observacao': medicamento.observacao,
      'criadoEm': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> remover(String id) async {
    await _collection.doc(id).delete();
  }
}
