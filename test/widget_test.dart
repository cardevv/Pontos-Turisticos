import 'package:flutter_test/flutter_test.dart';
import 'package:pontos_turisticos/main.dart';

void main() {
  testWidgets('Verifica renderizacao inicial do Catalogo de Pontos Turisticos',
      (WidgetTester tester) async {
    // Carrega o aplicativo
    await tester.pumpWidget(const CatalogoPontosApp());
    await tester.pumpAndSettle();

    // Verifica se o nome do aluno esta presente no app
    expect(find.textContaining('Carlos Eduardo'), findsWidgets);

    // Verifica se os pontos da Baixada Santista sao exibidos
    expect(find.text('Museu do Café'), findsOneWidget);
    expect(find.text('Santos'), findsWidgets);
  });
}
