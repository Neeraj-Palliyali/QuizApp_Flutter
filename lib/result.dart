import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "You did it";
    if (resultScore <= 35) {
      resultText = "You are awesome";
    } else if (resultScore <= 40) {
      resultText = "you are great";
    } else {
      resultText = "you are strange";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        RaisedButton(
          color: Colors.redAccent,
            child: Text(
              "Restart Quiz",
            ),
            onPressed: resetHandler)
      ],
    ));
  }
}
