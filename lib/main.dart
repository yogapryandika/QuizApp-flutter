import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour',
      'answers': [
        {'text': 'blue', 'score': 10},
        {'text': 'black', 'score': 20},
        {'text': 'red', 'score': 30},
        {'text': 'green', 'score': 15},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'duck', 'score': 10},
        {'text': 'fox', 'score': 20},
        {'text': 'bird', 'score': 30},
        {'text': 'cat', 'score': 15},
      ],
    },
    {
      'questionText': 'What\'s your favourite singer',
      'answers': [
        {'text': 'me', 'score': 10},
        {'text': 'you', 'score': 20},
        {'text': 'he', 'score': 30},
        {'text': 'she', 'score': 15},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more question');
    } else {
      print('no more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
