import 'package:captalis/services/metrics_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IAnswer', () {
    test('Deve converter de JSON corretamente', () {
      final json = {'question': 'Pergunta', 'answer': 'Resposta'};
      final answer = IAnswer.fromJson(json);

      expect(answer.question, 'Pergunta');
      expect(answer.answer, 'Resposta');
    });

    test('Deve converter para JSON corretamente', () {
      final answer = IAnswer(question: 'Pergunta', answer: 'Resposta');
      final json = IAnswer.toJson(answer);

      expect(json['question'], 'Pergunta');
      expect(json['answer'], 'Resposta');
    });
  });

  group('IFeedback', () {
    test('Deve converter de JSON corretamente', () {
      final json = {
        'name': 'John',
        'age': 30,
        'position': 'Dev',
        'yearsExperience': 5,
        'answers': [
          {'question': 'Pergunta', 'answer': 'Resposta'}
        ]
      };

      final feedback = IFeedback.fromJson(json);

      expect(feedback.name, 'John');
      expect(feedback.age, 30);
      expect(feedback.position, 'Dev');
      expect(feedback.yearsExperience, 5);
      expect(feedback.answers!.length, 1);
      expect(feedback.answers!.first.question, 'Pergunta');
    });

    test('Deve converter para JSON corretamente', () {
      final feedback = IFeedback(
        name: 'John',
        age: 30,
        position: 'Dev',
        yearsExperience: 5,
        answers: [IAnswer(question: 'Pergunta', answer: 'Resposta')],
      );

      final json = IFeedback.toJson(feedback);

      expect(json['name'], 'John');
      expect(json['age'], 30);
      expect(json['position'], 'Dev');
      expect(json['yearsExperience'], 5);
      expect(json['answers'].length, 1);
      expect(json['answers'].first['question'], 'Pergunta');
    });
  });
}
