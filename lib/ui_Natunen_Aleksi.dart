import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String screenOutput = "0";
  int number1 = 0;
  int number2 = 0;
  int calculationOutput = 0;

  void buttonCalculation(String btext){
    switch (btext) {
      case "+":
        calculationOutput = number1 + number2;
        break;
      case "-":
        calculationOutput = number1 - number2;
        break;
      case "=":
        screenOutput = "= " + calculationOutput.toString();
        number1 = 0;
        number2 = 0;
        break;
      default:
        if (number1 == 0) {
          screenOutput = btext;
          number1 = int.parse(btext);
        } else if (number2 == 0) {
          screenOutput = btext;
          number2 = int.parse(btext);
        }
    }
    setState(() {
      screenOutput;
    });
  }


  Widget button(String btext) {
    return Expanded(
        child: ElevatedButton(
          child: Text(
            btext,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          onPressed: () {
            buttonCalculation(btext);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(30)),

          ),
        ));
  }

  Widget button2(String btext) {
    return Expanded(
        child: ElevatedButton(
          child: Text(
            btext,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          onPressed: () {
            buttonCalculation(btext);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculator'),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 75),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )
                    ),
                    width: 400,
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        screenOutput,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.yellowAccent[700],
                        ),
                      ),
                    ),


                  )),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  SizedBox(height: 25),
                  Row(children: [
                    button("7"),
                    button("8"),
                    button("9"),
                    button2("+"),
                  ]),
                  SizedBox(height: 25),
                  Row(children: [
                    button("4"),
                    button("5"),
                    button("6"),
                    button2("-"),
                  ]),
                  SizedBox(height: 25),
                  Row(children: [
                    button("1"),
                    button("2"),
                    button("3"),
                    button2("="),

                  ]),
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}