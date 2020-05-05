import 'package:flutter/material.dart';
import 'questions.dart';


class quiz extends StatefulWidget {
  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  int i=0;

  List questions = [
    Questions.name(true,"India celebrates republic day on 26th Jan"),
    Questions.name(false,"India celebrates independance day on 14th august"),
    Questions.name(true,"India has 29 states"),
    Questions.name(false, "India invaded two countries till now"),
    Questions.name(false, "India is the sixth largest country in the world"),
    Questions.name(true, "India exports software to 90 countries"),
    Questions.name(false, "India has seven Union Territories"),
    Questions.name(true, "India is the oldest civilisation")
//    "India is in asia",
//    "India has 29 states",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Country Quiz",style: new TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body:

      Builder(
        builder:(BuildContext context)=> new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Image.asset("images/india.png",
              height: 220,
              width: 340,),
              new Padding(padding: EdgeInsets.only(top: 16)),
              new Container(
                height: 120,
                alignment: Alignment.center,
                decoration: new BoxDecoration(border: Border.all(color: Colors.green,width: 2,style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(16))),
                 child: Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20.0),
                    child: new Text(questions[i].question,style: new TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
                  )
              ),
              new Padding(padding: EdgeInsets.only(top: 20)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new FlatButton(onPressed:(){_checkchoice(true,context);}, child: new Text("TRUE",
                    style: new TextStyle(fontSize: 28),),
                    color: Colors.white,),
                  new FlatButton(onPressed:(){_checkchoice(false,context);}, child: new Text("FALSE",
                    style: new TextStyle(fontSize: 28),),
                    color: Colors.white,),
                ],
              ),
              new Padding(padding: EdgeInsets.only(top: 20)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new FlatButton(onPressed:_prevquestion, child:new Icon(Icons.arrow_back),
                  
                  /*new Text("<",
                    style: new TextStyle(fontSize: 28),),*/
                    color: Colors.white,),
                  new FlatButton(onPressed:_nextquestion, child:new Icon(Icons.arrow_forward) ,
//                  new Text(">",
//                    style: new TextStyle(fontSize: 28),),
                    color: Colors.white,),

            ],
          ),

        ]),
    ),
      )
    );
  }

  _nextquestion() {
    setState(() {
      i++;
      if(i>questions.length-1) i=0;

    });
  }

  _prevquestion() {
    setState(() {
      i--;
      if(i<0) i=questions.length-1;
    });
  }

  _checkchoice(bool choice, BuildContext context)  {

      if(choice==questions[i].isstrue)
      {
        final snackbar = SnackBar(content: new Text("CORRECT!"),duration: Duration(seconds: 1),backgroundColor: Colors.green,);
        Scaffold.of(context).showSnackBar(snackbar);
        _nextquestion();
      }
      else
        {
          final snackbar = SnackBar(content: new Text("INCORRECT!"),duration: Duration(seconds: 1),backgroundColor: Colors.red,);
          Scaffold.of(context).showSnackBar(snackbar);
          _nextquestion();
      }


  }
}
