import 'package:fluttering/models/option.dart';

enum Difficulty { easy, medium, hard }

class Question {
  final String id;
  final String title;
  final String explanation;
  final List<Option> options;
  final Difficulty difficulty;

  Question({
    required this.id,
    required this.title,
    required this.explanation,
    required this.options,
    required this.difficulty,
  });
}