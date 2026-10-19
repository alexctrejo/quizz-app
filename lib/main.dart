import 'package:flutter/material.dart';
import 'package:fluttering/models/category.dart';
import 'package:fluttering/models/option.dart';
import 'package:fluttering/models/question.dart';
import 'package:fluttering/models/score.dart';
import 'package:fluttering/screens/quiz_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final quizCategories = [

      Category(
        id: 'cat_history',
        name: 'Historia',
        iconPath: Icons.book,
        questions: [
          Question(
            id: 'q_01',
            title: '¿Quién fue el primer presidente de EE. UU.?',
            explanation: 'George Washington asumió el cargo en 1789.',
            difficulty: Difficulty.easy,
            options: [
              Option(text: 'George Washington', isCorrect: true),
              Option(text: 'Benjamin Franklin', isCorrect: false),
              Option(text: 'Thomas Jefferson', isCorrect: false),
            ],
          ),
        ],
      ),

      Category(
        id: 'cat_science',
        name: 'Ciencia',
        iconPath: Icons.science,
        questions: [
          Question(
            id: 'q_02',
            title: '¿Cuál es la fórmula química del agua?',
            explanation: 'El agua está compuesta por dos átomos de hidrógeno y uno de oxígeno.',
            difficulty: Difficulty.easy,
            options: [
              Option(text: 'H2O', isCorrect: true),
              Option(text: 'CO2', isCorrect: false),
              Option(text: 'O2', isCorrect: false),
            ],
          ),
        ],
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.quiz),
          title: const Text('Quizz App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Acción para abrir la configuración
              },
            ),
          ],
          
        ),
        body: Center(
          child: Categories(quizCategories: quizCategories),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.quizCategories,
  });

  final List<Category> quizCategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var category in quizCategories)
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              textStyle: const TextStyle(fontSize: 18.0),
            ),
            icon: Icon(category.iconPath),
            label: Text('- ${category.name}'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => QuizScreen(category: category, score: Score(count: 0)),
              ));
            },
        ),
      ],
    );
  }
}