import 'package:flutter/material.dart';
import './answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  Widget build(BuildContext Context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            selectHandler: () => (answerQuestion(answer['score'],)),
            answerText: answer['text'],
          ); //Answer(selectHandler: answerQuestion(), answerText: answer['text']);
        }).toList()
      ],
    );
  }
}
