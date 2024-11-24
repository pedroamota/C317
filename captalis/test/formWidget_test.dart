import 'package:captalis/view/steppers/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormWidget Tests', () {
    late TextEditingController firstController;
    late TextEditingController secondController;
    late TextEditingController thirdController;

    setUp(() {
      firstController = TextEditingController();
      secondController = TextEditingController();
      thirdController = TextEditingController();
    });

    tearDown(() {
      firstController.dispose();
      secondController.dispose();
      thirdController.dispose();
    });

    testWidgets('should render all components properly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FormWidget(
              firstSelectionController: firstController,
              secondSelectionController: secondController,
              thirdSelectionController: thirdController,
            ),
          ),
        ),
      );

      // Verifica se os textos estão presentes
      expect(find.text('Você sente que faz um bom uso de suas habilidades a na sua atual função?'), findsOneWidget);
      expect(find.text('Sente que esta no controle quando se trata do trabalho que preciso entregar?'), findsOneWidget);
      expect(find.text('Qual o nivel de respeito que as pessoas são tratadas na empresa? Independente de sua raça, classe ou genero?'), findsOneWidget);

      // Verifica os botões de seleção
      expect(find.byType(IconButton), findsNWidgets(18)); // 3 perguntas, 6 botões cada
    });

    testWidgets('should update firstSelectionController on selection', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FormWidget(
              firstSelectionController: firstController,
              secondSelectionController: secondController,
              thirdSelectionController: thirdController,
            ),
          ),
        ),
      );

      // Simula clicar no terceiro botão da primeira pergunta
      await tester.tap(find.byType(IconButton).at(2));
      await tester.pump();

      // Verifica se o controlador foi atualizado
      expect(firstController.text, '2');
    });
  });
}
