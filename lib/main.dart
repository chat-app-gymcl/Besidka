import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class Question {
  String question;
  String answer;

  Question(this.question, this.answer);
}

List<Question> questions = [
  Question('Jaká je hlavní město Francie?', 'Paříž'),
  Question('Jaká je hlavní město Španělska?', 'Madrid'),
  Question('Jaké je hlavní město Itálie?', 'Řím'),
];

class QuizApp extends StatelessWidget {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
  }

  void checkAnswer(String userAnswer) {
    String correctAnswer = questions[currentQuestionIndex].answer;

    if (userAnswer == correctAnswer) {
      print('Správná odpověď!');
    } else {
      print('Špatná odpověď');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikace pro kvíz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikace pro kvíz'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[currentQuestionIndex].question),
            TextField(
              decoration: InputDecoration(
                hintText: 'Zadejte svou odpověď zde',
              ),
              onSubmitted: (String userAnswer) {
                checkAnswer(userAnswer);
              },
            ),
            ElevatedButton(
              onPressed: nextQuestion,
              child: Text('Další otázka'),
            ),
          ],
        ),
      ),
    );
  }
}
