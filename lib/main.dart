import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

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
      'questionText': 'What\'s your favourite programming language?',
      'answers': [
        {'text': 'c', 'score': 10},
        {'text': 'c++', 'score': 25},
        {'text': 'Java', 'score': 15},
        {'text': 'Python', 'score': 20}
      ],
    },
    {
      'questionText': 'What do you develop using the language?',
      'answers': [
        {'text': 'WebApps', 'score': 30},
        {'text': 'Android Apps', 'score': 10},
        {'text': 'Software Solutions', 'score': 20},
        {'text': 'Others', 'score': 25}
      ],
    },
    {
      'questionText': 'Where did you learn to code?',
      'answers': [
        {'text': 'College', 'score': 20},
        {'text': 'Online', 'score': 15},
        {'text': 'Mentor', 'score': 30},
        {'text': 'Others', 'score': 25}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore+=score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
