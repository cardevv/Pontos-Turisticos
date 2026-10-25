/* =============================================================================
 * TRABALHO PRÁTICO 4 (TP4) - CATÁLOGO DE PONTOS TURÍSTICOS DA BAIXADA SANTISTA
 * 
 * ALUNO (Nome Completo): Carlos Eduardo
 * MATRÍCULA / IDENTIFICAÇÃO: cardevv
 * DISCIPLINA: Programação para Dispositivos Móveis
 * FRAMEWORK: Flutter
 * 
 * Requisitos atendidos:
 * - Uso de MaterialApp, Scaffold e AppBar com o nome do aluno.
 * - Lista de 9 pontos turísticos reais da Baixada Santista com ListView.
 * - Apresentação de nome, cidade, imagem (Image.network), descrição e 2 Checkboxes.
 * - Organização com Row, Column, Container, SizedBox, Padding e Margin.
 * - Gerenciamento de estado com StatefulWidget e setState.
 * - Código estruturado em métodos e widgets separados com nomes semânticos.
 * - Dados mantidos em memória sem uso de persistência externa.
 * ============================================================================= */

import 'package:flutter/material.dart';
import 'data/pontos_turisticos_data.dart';
import 'models/ponto_turistico.dart';

void main() {
  runApp(const CatalogoPontosApp());
}

/// Classe Principal da aplicação (MaterialApp).
/// Contém a identificação explícita do aluno conforme solicitado nos requisitos.
class CatalogoPontosApp extends StatelessWidget {
  /// Nome do aluno na classe principal do programa
  static const String nomeAluno = 'Carlos Eduardo';

  const CatalogoPontosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pontos Turísticos - $nomeAluno',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007791), // Azul Oceano (Baixada Santista)
          primary: const Color(0xFF007791),
          secondary: const Color(0xFFE28743),
          surface: const Color(0xFFF7F9FC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F4F8),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color(0xFF005F73),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
      ),
      home: const CatalogoPontosPage(),
    );
  }
}

/// Página principal do catálogo com gerenciamento de estado das marcações.
class CatalogoPontosPage extends StatefulWidget {
  const CatalogoPontosPage({super.key});

  @override
  State<CatalogoPontosPage> createState() => _CatalogoPontosPageState();
}

class _CatalogoPontosPageState extends State<CatalogoPontosPage> {
  /// Lista de pontos turísticos mantida em memória
  late List<PontoTuristico> _pontosTuristicos;

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de pontos turísticos reais da Baixada Santista
    _pontosTuristicos = obterPontosTuristicosIniciais();
  }

  /// Alterna o estado de favorito de um ponto turístico com setState
  void _alternarFavorito(PontoTuristico ponto, bool? novoValor) {
    setState(() {
      ponto.isFavorito = novoValor ?? false;
    });
  }

  /// Alterna o estado de visitado de um ponto turístico com setState
  void _alternarVisitado(PontoTuristico ponto, bool? novoValor) {
    setState(() {
      ponto.isVisitado = novoValor ?? false;
    });
  }

  /// Quantidade total de locais marcados como favoritos
  int get _totalFavoritos =>
      _pontosTuristicos.where((p) => p.isFavorito).length;

  /// Quantidade total de locais marcados como visitados
  int get _totalVisitados =>
      _pontosTuristicos.where((p) => p.isVisitado).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar(),
      body: Column(
        children: [
          // Painel de resumo informativo das marcações do usuário
          _construirPainelResumo(),

          // Lista de pontos turísticos utilizando ListView.builder
          Expanded(
            child: _construirListaPontosTuristicos(),
          ),
        ],
      ),
    );
  }

  /// Constrói a AppBar exigida, contendo o nome completo do aluno
  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Baixada Santista',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Pontos Turísticos • ${CatalogoPontosApp.nomeAluno}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Sobre o Trabalho',
          icon: const Icon(Icons.info_outline),
          onPressed: _exibirDialogoSobre,
        ),
      ],
    );
  }

  /// Constrói o painel de resumo visual com Row, Column, Container e SizedBox
  Widget _construirPainelResumo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _construirItemContador(
            icone: Icons.place,
            cor: const Color(0xFF005F73),
            rotulo: 'Locais',
            valor: '${_pontosTuristicos.length}',
          ),
          Container(
            height: 36,
            width: 1,
            color: Colors.grey.shade300,
          ),
          _construirItemContador(
            icone: Icons.favorite,
            cor: Colors.redAccent,
            rotulo: 'Favoritos',
            valor: '$_totalFavoritos',
          ),
          Container(
            height: 36,
            width: 1,
            color: Colors.grey.shade300,
          ),
          _construirItemContador(
            icone: Icons.check_circle,
            cor: Colors.green,
            rotulo: 'Visitados',
            valor: '$_totalVisitados',
          ),
        ],
      ),
    );
  }

  /// Widget auxiliar para cada contador do painel de resumo
  Widget _construirItemContador({
    required IconData icone,
    required Color cor,
    required String rotulo,
    required String valor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor, size: 22),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valor,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cor,
              ),
            ),
            Text(
              rotulo,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Constrói a lista de pontos turísticos utilizando ListView
  Widget _construirListaPontosTuristicos() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      itemCount: _pontosTuristicos.length,
      itemBuilder: (context, index) {
        final ponto = _pontosTuristicos[index];
        return _construirCardPontoTuristico(ponto);
      },
    );
  }

  /// Constrói o card completo de cada ponto turístico
  Widget _construirCardPontoTuristico(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem ilustrativa do local com Image.network
          _construirImagemIlustrativa(ponto),

          // Informações do ponto (Nome, Cidade, Descrição)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Linha superior com Nome e Badge da Cidade
                _construirCabecalhoPonto(ponto),

                const SizedBox(height: 10),

                // Breve descrição
                Text(
                  ponto.descricao,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.45,
                    color: Colors.grey.shade800,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 16, thickness: 0.8),
          ),

          // Seção com os 2 Checkboxes (Favorito e Visitado)
          _construirSecaoCheckboxes(ponto),
        ],
      ),
    );
  }

  /// Constrói a imagem do ponto turístico com tratamento de loading e erro
  Widget _construirImagemIlustrativa(PontoTuristico ponto) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(
        children: [
          Image.network(
            ponto.urlImagem,
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 190,
                color: Colors.grey.shade200,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: const Color(0xFF007791),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 190,
                color: Colors.grey.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image, size: 48, color: Colors.grey.shade600),
                    const SizedBox(height: 6),
                    Text(
                      'Imagem indisponível',
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
          // Badge sobreposto com número de identificação
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '#${ponto.id}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Constrói o cabeçalho do card com Nome do Ponto e Cidade
  Widget _construirCabecalhoPonto(PontoTuristico ponto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            ponto.nome,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D2D44),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF007791).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF007791).withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                size: 14,
                color: Color(0xFF007791),
              ),
              const SizedBox(width: 4),
              Text(
                ponto.cidade,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF007791),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Constrói a linha com os 2 Checkboxes para marcar/desmarcar Favorito e Visitado
  Widget _construirSecaoCheckboxes(PontoTuristico ponto) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 12, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Checkbox 1: Favorito
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: ponto.isFavorito,
                activeColor: Colors.redAccent,
                onChanged: (bool? valor) => _alternarFavorito(ponto, valor),
              ),
              InkWell(
                onTap: () => _alternarFavorito(ponto, !ponto.isFavorito),
                child: Row(
                  children: [
                    Icon(
                      ponto.isFavorito ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: ponto.isFavorito ? Colors.redAccent : Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Favorito',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: ponto.isFavorito
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: ponto.isFavorito
                            ? Colors.redAccent
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Checkbox 2: Visitado
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: ponto.isVisitado,
                activeColor: Colors.green,
                onChanged: (bool? valor) => _alternarVisitado(ponto, valor),
              ),
              InkWell(
                onTap: () => _alternarVisitado(ponto, !ponto.isVisitado),
                child: Row(
                  children: [
                    Icon(
                      ponto.isVisitado
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      size: 18,
                      color: ponto.isVisitado ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Visitado',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: ponto.isVisitado
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: ponto.isVisitado
                            ? Colors.green
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Exibe modal com detalhes informativos sobre o aluno e a entrega
  void _exibirDialogoSobre() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.school, color: Color(0xFF007791)),
            SizedBox(width: 8),
            Text('TP4 - Informações'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Catálogo de Pontos Turísticos da Baixada Santista',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('Aluno: Carlos Eduardo'),
            Text('Disciplina: Desenv. Dispositivos Móveis'),
            SizedBox(height: 8),
            Text(
              'Recursos demonstrados: MaterialApp, Scaffold, AppBar, ListView, Row, Column, Container, SizedBox, Padding, Margin, StatefulWidget, setState e 2 Checkboxes por item.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
