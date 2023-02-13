import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 12,
        },
        {
          'text': 'Snake',
          'score': 22,
        },
        {
          'text': 'Elephant',
          'score': 42,
        },
        {
          'text': 'Lion',
          'score': 32,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite Flower?',
      'answers': [
        {
          'text': 'Rose',
          'score': 42,
        },
        {
          'text': 'Sunflower',
          'score': 22,
        },
        {
          'text': 'Lotus',
          'score': 32,
        },
        {
          'text': 'Jasmine',
          'score': 8,
        },
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Question!');
    } else {
      print('No more Questions!');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, resetQuiz),
    ));
  }
}
