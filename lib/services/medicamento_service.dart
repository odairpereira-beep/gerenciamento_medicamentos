import '../models/medicamento.dart';

class MedicamentoService {
  static final List<Medicamento> _medicamentos = [];

  static List<Medicamento> listar() {
    return List.unmodifiable(_medicamentos);
  }

  static void adicionar(Medicamento medicamento) {
    _medicamentos.add(medicamento);
  }

  static void remover(String id) {
    _medicamentos.removeWhere((medicamento) => medicamento.id == id);
  }
}

/* Foi criado um serviço separado para evitar que a tela fique responsável pelo
armazenamento dos dados. Nesta primeira versão, os dados são mantidos em memória.
Posteriormente, esse serviço será substituído por uma implementação utilizando
Firebase/Cloud Firestone, sem necessidade de modificar significamente as telas. */
