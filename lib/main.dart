import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
  }

  void checkAnswer(String userAnswer) {
    String correctAnswer = questions[currentQuestionIndex].answer;

    if (userAnswer == correctAnswer) {
      print('Correct answer!');
    } else {
      print('Incorrect answer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[currentQuestionIndex].question),
            RaisedButton(
              onPressed: nextQuestion,
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton({required void Function() onPressed, required Text child}) {}
}

class Question {
  String question;
  String answer;

  Question(this.question, this.answer);
}

List<Question> questions = [
  Question('What is the capital of France?', 'Paris'),
  Question('What is the capital of Spain?', 'Madrid'),
  Question('What is the capital of Italy?', 'Rome'),
];
