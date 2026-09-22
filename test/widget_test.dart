import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_medicamentos/main.dart';
import 'package:gerenciamento_medicamentos/screens/home_screen.dart';

void main() {
  testWidgets('A aplicação deve abrir corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MedicamentosApp(
        home: HomeScreen(medicamentosStream: Stream.empty()),
      ),
    );

    await tester.pump();

    expect(find.text('Meus Medicamentos'), findsOneWidget);
    expect(find.text('Adicionar medicamento'), findsOneWidget);
  });
}
