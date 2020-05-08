import 'package:flutter/material.dart';

class planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new planetstate();
  }
}

class planetstate extends State<planet> {
  int radioValue = 0;

  final TextEditingController _weightController = new TextEditingController();
  double _finalvalue = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalvalue = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "Your weight on the palnet is ${_finalvalue.toStringAsFixed(1)}";
          break;
        case 1:
          _finalvalue = calculateWeight(_weightController.text, 0.56);
          _formattedText =
              "Your weight on the palnet is ${_finalvalue.toStringAsFixed(1)}";
          break;
        case 2:
          _finalvalue = calculateWeight(_weightController.text, 0.26);
          _formattedText =
              "Your weight on the palnet is ${_finalvalue.toStringAsFixed(1)}";
          break;
      }
      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black12,
          title: new Text(
            "Weight on Planet X",
            style: new TextStyle(
                color: Colors.white70,
                fontSize: 28.89,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white70,
        body:
            // new Padding(padding: EdgeInsets.all(29.0)),
            new Container(
                alignment: Alignment.center,
                // child: new Padding(padding: EdgeInsets.all(29.0)),
                child: new ListView(
                  padding: EdgeInsets.all(10.0),
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.all(29.0)),
                    new Image.asset(
                      "images/105 planet.png",
                      width: 79.0,
                      height: 99.0,
                      color: Colors.black,
                    ),
                    new Container(
                      // width: 380.0,
                      //height= 150.0,
                      //margin: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: new Column(
                        children: <Widget>[
                          new TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              hintText: "In Pounds",
                              labelText: "Your Weight On Earth",
                              icon: new Icon(Icons.person_outline),
                            ),
                          ),
                          new Padding(padding: EdgeInsets.all(7.0)),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio<int>(
                                  activeColor: Colors.deepOrangeAccent,
                                  value: 0,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                              new Text(
                                "Pluto",
                                style: new TextStyle(
                                    color: Colors.white70,
                                    fontStyle: FontStyle.normal),
                              ),
                              new Radio<int>(
                                  activeColor: Colors.redAccent,
                                  value: 1,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                              new Text(
                                "Venus",
                                style: new TextStyle(
                                    color: Colors.white70,
                                    fontStyle: FontStyle.normal),
                              ),
                              new Radio<int>(
                                  activeColor: Colors.blueAccent,
                                  value: 2,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                              new Text(
                                "Mars",
                                style: new TextStyle(
                                    color: Colors.white70,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                          new Padding(padding: EdgeInsets.all(15.0)),
                          new Text(
                            _weightController.text.isEmpty ? "Please Enter Text" : _formattedText + "lbs",
                            //"$_formattedText lbs",
                            style: new TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                  ],
                )));
  }

  double calculateWeight(String weight, double multiplier) {
    if (weight.isNotEmpty && int.parse(weight) > 0.0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong !");
      return int.parse(weight) * 0.55;
    }
  }
}
