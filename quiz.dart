import 'package:flutter/material.dart';
import './question.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int i = 0;

  List questions = [
    Question(true, "India celebrates republic day on 26th Jan"),
    Question(false, "India celebrates independance day on 14th august"),
    Question(true, "India has 29 states")
//    "India is in asia",
//    "India has 29 states",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Quiz",
            style: new TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: Colors.white,
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // new Image.asset(
                //   "images/india.png",
                //   height: 220,
                //   width: 340,
                // ),
                new Padding(padding: EdgeInsets.only(top: 16)),
                new Container(
                    height: 120,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                        border: Border.all(
                            color: Colors.green,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Text(
                        questions[i].question,
                        style: new TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    )),
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        _check(true);
                      },
                      child: new Text(
                        "TRUE",
                        style: new TextStyle(fontSize: 28),
                      ),
                      color: Colors.white,
                    ),
                    new FlatButton(
                      onPressed: () {
                        _check(false);
                      },
                      child: new Text(
                        "FALSE",
                        style: new TextStyle(fontSize: 28),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: _prevquestion,
                      child: new Text(
                        "<",
                        style: new TextStyle(fontSize: 28),
                      ),
                      color: Colors.white,
                    ),
                    new FlatButton(
                      onPressed: _nextquestion,
                      child: new Text(
                        ">",
                        style: new TextStyle(fontSize: 28),
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ]),
        ));
  }

  _nextquestion() {
    setState(() {
      i++;
      if (i > questions.length - 1) i = questions.length - 1;
    });
  }

  _prevquestion() {
    setState(() {
      i--;
      if (i < 0) i = 0;
    });
  }

  _check(bool choice) {
    if (choice == questions[i].isstrue) {
      debugPrint("CORRECT");
    } else {
      debugPrint("WRONG");
    }
  }
}
