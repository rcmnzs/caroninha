class Passageiro {
  const Passageiro({
    required this.id,
    required this.nome,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    this.telefone,
  });

  final String id;
  final String nome;
  final String? telefone;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
}
