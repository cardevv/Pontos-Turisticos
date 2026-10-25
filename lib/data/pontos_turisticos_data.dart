import '../models/ponto_turistico.dart';

/// Lista em memória com os pontos turísticos reais da Baixada Santista.
/// Aluno: Carlos Eduardo
/// TP4 - Catálogo de Pontos Turísticos
List<PontoTuristico> obterPontosTuristicosIniciais() {
  return [
    PontoTuristico(
      id: 1,
      nome: 'Museu do Café',
      cidade: 'Santos',
      urlImagem:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Instalado no imponente palácio da antiga Bolsa Oficial de Café (1922), o museu preserva a história do grão no Brasil, com vitrais de Benedicto Calixto, piso em mármore e degustação de cafés especiais.',
      isFavorito: true,
      isVisitado: true,
    ),
    PontoTuristico(
      id: 2,
      nome: 'Mirante Oscar Niemeyer (Ilha Porchat)',
      cidade: 'São Vicente',
      urlImagem:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Monumento projetado pelo renomado arquiteto Oscar Niemeyer em comemoração aos 500 anos do Brasil, localizado no topo da Ilha Porchat com uma das vistas panorâmicas mais espetaculares de São Vicente e Santos.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 3,
      nome: 'Fortaleza de Santo Amaro da Barra Grande',
      cidade: 'Guarujá',
      urlImagem:
          'https://images.unsplash.com/photo-1590523741831-ab7e8b8f9c7f?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Fortificação militar histórica erguida no século XVI (1584) pela coroa espanhola para defender o canal de entrada do porto de Santos contra ataques de piratas e corsários.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 4,
      nome: 'Jardins da Orla da Praia',
      cidade: 'Santos',
      urlImagem:
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Reconhecido pelo Guinness World Records como o maior jardim de praia do mundo em extensão, possui mais de 5.300 metros de comprimento, canteiros floridos e ciclovia à beira-mar.',
      isFavorito: true,
      isVisitado: true,
    ),
    PontoTuristico(
      id: 5,
      nome: 'Palácio das Artes',
      cidade: 'Praia Grande',
      urlImagem:
          'https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Espaço cultural e arquitetônico de destaque no litoral, abrigando o Teatro Serafim Gonzalez, o Museu da Cidade e a Galeria Nilton Zanotti para exposições de artes plásticas.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 6,
      nome: 'Forte de São João de Bertioga',
      cidade: 'Bertioga',
      urlImagem:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Considerada a fortificação militar mais antiga do Brasil (1547), situada na foz do Canal de Bertioga. Abriga acervo histórico colonial e artefatos indígenas.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 7,
      nome: 'Convento Nossa Senhora da Conceição',
      cidade: 'Itanhaém',
      urlImagem:
          'https://images.unsplash.com/photo-1548625361-195fe5795df5?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Patrimônio histórico do século XVI erguido no alto do Morro do Itaguaçu na segunda cidade mais antiga do Brasil, oferecendo uma vista deslumbrante e rica história franciscana.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 8,
      nome: 'Parque Ecológico Perequê',
      cidade: 'Cubatão',
      urlImagem:
          'https://images.unsplash.com/photo-1448375240586-882707db888b?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Área de preservação ambiental da Mata Atlântica localizada aos pés da Serra do Mar, com rios de águas cristalinas, cachoeiras e trilhas ecológicas monitoradas.',
      isFavorito: false,
      isVisitado: false,
    ),
    PontoTuristico(
      id: 9,
      nome: 'Plataforma Marítima de Pesca',
      cidade: 'Mongaguá',
      urlImagem:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
      descricao:
          'Uma das maiores plataformas de pesca em concreto armado do mundo, avançando 400 metros mar adentro em formato de "T", atraindo pescadores e turistas para contemplação do oceano.',
      isFavorito: false,
      isVisitado: false,
    ),
  ];
}
