import '../../../core/banco/enums.dart';

class Transacao {
  const Transacao({
    required this.id,
    required this.tipo,
    required this.categoria,
    required this.valorCentavos,
    required this.data,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    this.descricao,
    this.caronaId,
  });

  final String id;
  final TipoTransacao tipo;
  final CategoriaTransacao categoria;
  final int valorCentavos;
  final DateTime data;
  final String? descricao;
  final String? caronaId;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
}
