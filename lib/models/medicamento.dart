class Medicamento {
  String id;
  String nome;
  String dosagem;
  String horario;
  String frequencia;
  String observacao;

  Medicamento({
    required this.id,
    required this.nome,
    required this.dosagem,
    required this.horario,
    required this.frequencia,
    required this.observacao,
  });
}

/* A classe representa o conceito de Medicamento definido no modelo de classes do
projeto. Os atributos foram tipados como String, pois nessa primeira implementação
representam informações fornecidas diretamente pelo usuário. */
