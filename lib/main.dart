import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operations;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      firstnum = 0;
      secondnum = 0;
      texttodisplay = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "/" ||
        btntext == "x") {
          firstnum=int.parse(texttodisplay);
          res="";
          operations=btntext;
        }else if(btntext=="="){
            secondnum=int.parse(texttodisplay);
            if(operations == "+"){
              res=(firstnum+secondnum).toString();
            }if(operations=="-"){
              res=(firstnum-secondnum).toString();
            }if(operations=="x"){
              res=(firstnum*secondnum).toString();
            }if(operations=="/"){
              res=(firstnum~/secondnum).toString();
            }
        }else{
          res=int.parse(texttodisplay+btntext).toString();
        }
        setState(() {
          texttodisplay=res;
        });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        padding: EdgeInsets.all(15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("calculator"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "$texttodisplay",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("C"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              ),
            ],
          ),
        ));
  }
}
