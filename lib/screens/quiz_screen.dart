import 'package:flutter/material.dart';
import 'package:fluttering/models/category.dart';
import 'package:fluttering/models/score.dart';

class QuizScreen extends StatelessWidget {

  final Category category;
  final Score score;

  const QuizScreen({super.key, required this.category, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${category.name}'),
        leading: Text('Score: ${score.count}'), // Aquí puedes mostrar el puntaje actual
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var question in category.questions)
              Column(
                children: [
                  Text(
                    question.title,
                    style: const TextStyle(fontSize: 20.0),
                  ),

                  for (var option in question.options)
                    TextButton(
                      onPressed: () {
                        if (option.isCorrect){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('¡Respuesta correcta!')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Respuesta incorrecta.')),
                          );
                        }
                      },
                      child: Text(option.text),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}