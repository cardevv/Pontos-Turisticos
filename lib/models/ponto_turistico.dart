/// Modelo que representa um Ponto Turístico da Baixada Santista.
/// 
/// Aluno: Carlos Eduardo
/// Disciplina: Desenvolvimento para Dispositivos Móveis
/// Trabalho: TP4 - Catálogo de Pontos Turísticos
class PontoTuristico {
  final int id;
  final String nome;
  final String cidade;
  final String urlImagem;
  final String descricao;
  bool isFavorito;
  bool isVisitado;

  PontoTuristico({
    required this.id,
    required this.nome,
    required this.cidade,
    required this.urlImagem,
    required this.descricao,
    this.isFavorito = false,
    this.isVisitado = false,
  });
}
