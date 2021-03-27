import 'package:flutter/material.dart';

void main() => runApp(myapp());

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: Cal(),
    );
  }
}

class Cal extends StatefulWidget {
  Cal({Key key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  int firstno;
  int secondno;
  String texttodisplay = "";
  String res;
  String operatortoperform;

  void click(String value) {
    if (value == "Clear") {
      print(value);
      texttodisplay = "";
      firstno = 0;
      secondno = 0;
      res = "";
    } else if (value == "+" || value == "-" || value == "/" || value == "x") {
      firstno = int.parse(texttodisplay);
      res = "";
      operatortoperform = value;
    } else if (value == "=") {
      secondno = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstno + secondno).toString();
      }
      if (operatortoperform == "-") {
        res = (firstno - secondno).toString();
      }
      if (operatortoperform == "x") {
        res = (firstno * secondno).toString();
      }
      if (operatortoperform == "/") {
        res = (firstno / secondno).toString();
      }
    } else {
      res = int.parse(texttodisplay + value).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => click(btnval),
      child: Text(
        "$btnval",
        style: TextStyle(fontSize: 20.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("CALCULATOR"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                Color(0xffee0000),
                Color(0xffeeee00)
              ], // red to yellow
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black87),
                ),
              )),
              Row(
                children: <Widget>[
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+")
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-")
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("/")
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("0"),
                  custombutton("="),
                  custombutton("x"),
                  custombutton("Clear")
                ],
              )
            ],
          ),
        ));
  }
}
