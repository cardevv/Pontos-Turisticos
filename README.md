# 🏖️ Catálogo de Pontos Turísticos - Baixada Santista

**Trabalho Prático 4 (TP4 - 2,0 pts de P2)**  
**Aluno:** Carlos Eduardo  
**Repositório:** [https://github.com/cardevv/Pontos-Turisticos](https://github.com/cardevv/Pontos-Turisticos)  
**Disciplina:** Programação para Dispositivos Móveis / Flutter  

---

## 📱 Visão Geral do Aplicativo

Aplicativo desenvolvido em Flutter que apresenta um catálogo interativo de pontos turísticos reais da **Baixada Santista** (região metropolitana do litoral paulista), permitindo aos usuários visualizar informações detalhadas e marcar/desmarcar locais como **Favorito** ou **Visitado** em tempo real.

---

## 🏛️ Pontos Turísticos Catalogados

O app apresenta 9 locais turísticos reais e emblemáticos da região:

1. **Museu do Café** (Santos) — Palácio da antiga Bolsa Oficial de Café (1922) com vitrais de Benedicto Calixto e arquitetura suntuosa.
2. **Mirante Oscar Niemeyer / Ilha Porchat** (São Vicente) — Monumento aos 500 anos do Brasil com vista panorâmica da baía de São Vicente e Santos.
3. **Fortaleza de Santo Amaro da Barra Grande** (Guarujá) — Fortaleza histórica militar de 1584 erguida para proteção do estuário santista.
4. **Jardins da Orla da Praia** (Santos) — Maior jardim de praia do mundo segundo o Guinness World Records (>5,3 km).
5. **Palácio das Artes** (Praia Grande) — Complexo cultural com teatro, Museu da Cidade e galeria de exposições.
6. **Forte de São João de Bertioga** (Bertioga) — A mais antiga fortificação militar preservada do Brasil (1547).
7. **Convento Nossa Senhora da Conceição** (Itanhaém) — Monumento histórico colonial do século XVI no alto do Morro do Itaguaçu.
8. **Parque Ecológico Perequê** (Cubatão) — Reserva de Mata Atlântica com cachoeiras, rios cristalinos e trilhas aos pés da Serra do Mar.
9. **Plataforma Marítima de Pesca** (Mongaguá) — Estrutura de concreto em "T" que avança 400m mar adentro no oceano.

---

## ✅ Checklist de Requisitos Atendidos

| Requisito | Status | Implementação |
|---|:---:|---|
| **MaterialApp, Scaffold e AppBar** | ✔️ | Implementados com estilização Material 3 e tema oceânico |
| **Pelo menos 7 pontos turísticos reais da Baixada Santista** | ✔️ | 9 pontos reais e catalogados com descrições fiéis |
| **ListView** | ✔️ | `ListView.builder` para renderização eficiente da lista |
| **Apresentação por ponto: nome, cidade, imagem, descrição** | ✔️ | Todos os 4 campos detalhados e diagramados em cada card |
| **Imagem ilustrativa (Image.network)** | ✔️ | `Image.network` com `loadingBuilder` e `errorBuilder` |
| **2 Checkboxes (Favorito e Visitado)** | ✔️ | Dois `Checkbox` interativos com ícones e textos clicáveis |
| **Row, Column, Container e espaçamentos (margin, padding, SizedBox)** | ✔️ | Todos os widgets estruturais amplamente utilizados |
| **StatefulWidget e setState** | ✔️ | `CatalogoPontosPage` com `setState` gerenciando as marcações |
| **Organização em métodos e/ou widgets separados** | ✔️ | Código modularizado em `_construirCardPontoTuristico`, `_construirCabecalhoPonto`, `_construirSecaoCheckboxes`, etc. |
| **Dados em memória (sem persistência externa)** | ✔️ | Mock em memória inicializado no `initState` |
| **Repositório próprio com ao menos 3 commits relevantes** | ✔️ | Repositório no GitHub com commits semânticos por etapa |
| **Nome completo do aluno na AppBar e no início do código (classe Principal)** | ✔️ | Nome **Carlos Eduardo** na AppBar, cabeçalho e constante `CatalogoPontosApp.nomeAluno` |
| **Nomes coerentes para classes, métodos e variáveis** | ✔️ | Nomenclatura semântica em conformidade com as boas práticas Dart |

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- Flutter SDK 3.x instalado e configurado no PATH
- Emulador Android, dispositivo físico ou navegador Web habilitado

### Passo a Passo

```bash
# 1. Clone o repositório
git clone https://github.com/cardevv/Pontos-Turisticos.git

# 2. Acesse a pasta do projeto
cd Pontos-Turisticos

# 3. Baixe as dependências
flutter pub get

# 4. Execute a aplicação (escolha o dispositivo ou emulador desejado)
flutter run

# Para rodar os testes automatizados:
flutter test
```

---

## 📂 Estrutura de Pastas

```
lib/
├── data/
│   └── pontos_turisticos_data.dart   # Dados em memória dos 9 pontos turísticos
├── models/
│   └── ponto_turistico.dart          # Modelo de dados da entidade PontoTuristico
└── main.dart                         # Ponto de entrada, MaterialApp, AppBar e widgets
test/
└── widget_test.dart                  # Testes automatizados de widget
```
