import 'package:captalis/view/steppers/feedback_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('FeedbackWidget Tests', () {
    late TextEditingController nameController;
    late TextEditingController yearsController;
    late TextEditingController positionController;
    late TextEditingController yearsExpController;

    setUp(() {
      nameController = TextEditingController();
      yearsController = TextEditingController();
      positionController = TextEditingController();
      yearsExpController = TextEditingController();
    });

    tearDown(() {
      nameController.dispose();
      yearsController.dispose();
      positionController.dispose();
      yearsExpController.dispose();
    });

    testWidgets('Renderização de componentes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeedbackWidget(
              nameController: nameController,
              yearsController: yearsController,
              positionController: positionController,
              yearsExpController: yearsExpController,
            ),
          ),
        ),
      );

      // Verifica se os textos estão presentes
      expect(find.text('Digite seu nome:'), findsOneWidget);
      expect(find.text('Digite sua idade:'), findsOneWidget);
      expect(find.text('Selecione seu cargo:'), findsOneWidget);
      expect(find.text('Está a quantos anos na empresa:'), findsOneWidget);

      // Verifica campos de texto e dropdown
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    });

    testWidgets('Entra de informações', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeedbackWidget(
              nameController: nameController,
              yearsController: yearsController,
              positionController: positionController,
              yearsExpController: yearsExpController,
            ),
          ),
        ),
      );

      // Simula digitação no campo de nome
      await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
      await tester.pump();

      // Verifica se o controlador foi atualizado
      expect(nameController.text, 'John Doe');
    });

    testWidgets('Update de seleção', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeedbackWidget(
              nameController: nameController,
              yearsController: yearsController,
              positionController: positionController,
              yearsExpController: yearsExpController,
            ),
          ),
        ),
      );

      // Simula a seleção do dropdown
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cargo 2').last);
      await tester.pumpAndSettle();

      // Verifica se o controlador foi atualizado
      expect(positionController.text, 'Cargo 2');
    });
  });
}
