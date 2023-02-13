import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get ResultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'you are awesomec an innoncent!';
    } else if (resultScore <= 82) {
      resultText = 'pretty likeable!';
    } else if (resultScore <= 90) {
      resultText = 'You are  strange?';
    } else {
      resultText = 'you are so bad';
    }

    return resultText;
  }

  Widget build(BuildContext Context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            ResultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}
