// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class IAnswer {
  final String? question;
  final String? answer;

  IAnswer({this.question, this.answer});

  factory IAnswer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return IAnswer(
      question: data['question'],
      answer: data['answer'],
    );
  }

  static Map<String, dynamic> toJson(IAnswer answer) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = answer.question;
    data['answer'] = answer.answer;
    return data;
  }

  static IAnswer fromJson(Map<String, dynamic> json) {
    return IAnswer(
      question: json['question'],
      answer: json['answer'],
    );
  }
}

class IFeedback {
  final String? name;
  final int? age;
  final String? position;
  final int? yearsExperience;
  final List<IAnswer>? answers;

  IFeedback({this.name, this.age, this.position, this.yearsExperience, this.answers});

  factory IFeedback.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return IFeedback(
      name: data['name'],
      age: data['age'],
      position: data['position'],
      yearsExperience: data['yearsExperience'],
      answers: (data['answers'] as List).map((e) => IAnswer.fromFirestore(e)).toList(),
    );
  }

  static Map<String, dynamic> toJson(IFeedback feedback) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = feedback.name;
    data['age'] = feedback.age;
    data['position'] = feedback.position;
    data['yearsExperience'] = feedback.yearsExperience;
    data['answers'] = feedback.answers!.map((e) => IAnswer.toJson(e)).toList();
    return data;
  }

  static IFeedback fromJson(Map<String, dynamic> json) {
    return IFeedback(
      name: json['name'],
      age: json['age'],
      position: json['position'],
      yearsExperience: json['yearsExperience'],
      answers: (json['answers'] as List).map((e) => IAnswer.fromJson(e)).toList(),
    );
  }
}

class MetricsService{
  final db = FirebaseFirestore.instance;

  Future<void> saveFeedback(IFeedback feedback) async {
    try {
      await db.collection('feedbacks').add(IFeedback.toJson(feedback));
    } catch (e) {
      print(e);
    }
  }

  Stream<List<IFeedback>> getFeedbacks() {
    return db.collection('feedbacks').snapshots().map((snapshot) => snapshot.docs.map((doc) => IFeedback.fromFirestore(doc)).toList());
  }

  Future<void> deleteFeedback(String id) async {
    try {
      await db.collection('feedbacks').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateFeedback(IFeedback feedback, String id) async {
    try {
      await db.collection('feedbacks').doc(id).update(IFeedback.toJson(feedback));
    } catch (e) {
      print(e);
    }
  }
}