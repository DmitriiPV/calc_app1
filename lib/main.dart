import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),

    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calcbutton(String buttonText, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(buttonText);
        },
        child: Text(buttonText,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calculator'), backgroundColor: Colors.black,),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Calculator display
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Text(equation,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 50
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Text(result,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 50
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //here buttons functions
                  calcbutton('AC', Colors.grey, Colors.black),
                  calcbutton('<<', Colors.grey, Colors.black),
                  calcbutton('%', Colors.grey, Colors.black),
                  calcbutton('/', Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //here buttons functions
                  calcbutton('7', Colors.grey.shade800, Colors.white),
                  calcbutton('8', Colors.grey.shade800, Colors.white),
                  calcbutton('9', Colors.grey.shade800, Colors.white),
                  calcbutton('x', Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //here buttons functions
                  calcbutton('4', Colors.grey.shade800, Colors.white),
                  calcbutton('5', Colors.grey.shade800, Colors.white),
                  calcbutton('6', Colors.grey.shade800, Colors.white),
                  calcbutton('-', Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //here buttons functions
                  calcbutton('1', Colors.grey.shade800, Colors.white),
                  calcbutton('2', Colors.grey.shade800, Colors.white),
                  calcbutton('3', Colors.grey.shade800, Colors.white),
                  calcbutton('+', Colors.amber.shade700, Colors.white),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    onPressed: () {
                      calculation("0");
                    },
                    shape: StadiumBorder(),
                    child: Text("0",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white
                      ),
                    ),
                    color: Colors.grey.shade800,
                  ),
                  calcbutton('.', Colors.grey.shade800, Colors.white),
                  calcbutton('=', Colors.amber.shade700, Colors.white),
                ],
              )
            ],
          ),
        )
    );
  }

  String equation = "0";
  String result = "0";
  String expression = "";

  calculation(String buttonText){
    setState(() {
      if(buttonText == "AC"){
        equation = "0";
        result = "0";
      }

      else if(buttonText == "<<"){
        equation = equation.substring(0, equation.length - 1);
        print(16);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if(result!='Infinity'){
            print(result);
          }else {
            result= "?????????????? ???? 0!";
          }
        } catch (e) {
          result = "????????????";
        }
      }

      else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
    // dynamic text ='0';
    // double numOne = 0;
    // double numTwo = 0;
    //
    // dynamic result = '';
    // dynamic finalResult = '';
    // dynamic opr = '';
    // dynamic preOpr = '';
    // void calculation(btnText) {
    //
    //
    //   if(btnText  == 'AC') {
    //     text ='0';
    //     numOne = 0;
    //     numTwo = 0;
    //     result = '';
    //     finalResult = '0';
    //     opr = '';
    //     preOpr = '';
    //
    //   } else if( opr == '=' && btnText == '=') {
    //
    //     if(preOpr == '+') {
    //       finalResult = add();
    //     } else if( preOpr == '-') {
    //       finalResult = sub();
    //     } else if( preOpr == 'x') {
    //       finalResult = mul();
    //     } else if( preOpr == '/') {
    //       finalResult = div();
    //     }
    //
    //   } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
    //
    //     if(numOne == 0) {
    //       numOne = double.parse(result);
    //     } else {
    //       numTwo = double.parse(result);
    //     }
    //
    //     if(opr == '+') {
    //       finalResult = add();
    //     } else if( opr == '-') {
    //       finalResult = sub();
    //     } else if( opr == 'x') {
    //       finalResult = mul();
    //     } else if( opr == '/') {
    //       finalResult = div();
    //     }
    //     preOpr = opr;
    //     opr = btnText;
    //     result = '';
    //   }
    //   else if(btnText == '%') {
    //     result = numOne / 100;
    //     finalResult = doesContainDecimal(result);
    //   } else if(btnText == '.') {
    //     if(!result.toString().contains('.')) {
    //       result = result.toString()+'.';
    //     }
    //     finalResult = result;
    //   }
    //
    //   else if(btnText == '+/-') {
    //     result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
    //     finalResult = result;
    //
    //   }
    //
    //   else {
    //     result = result + btnText;
    //     finalResult = result;
    //   }
    //
    //
    //   setState(() {
    //     text = finalResult;
    //   });
    //
    // }
    //
    //
    // String add() {
    //   result = (numOne + numTwo).toString();
    //   numOne = double.parse(result);
    //   return doesContainDecimal(result);
    // }
    //
    // String sub() {
    //   result = (numOne - numTwo).toString();
    //   numOne = double.parse(result);
    //   return doesContainDecimal(result);
    // }
    // String mul() {
    //   result = (numOne * numTwo).toString();
    //   numOne = double.parse(result);
    //   return doesContainDecimal(result);
    // }
    // String div() {
    //   result = (numOne / numTwo).toString();
    //   numOne = double.parse(result);
    //   return doesContainDecimal(result);
    // }
    //
    //
    // String doesContainDecimal(dynamic result) {
    //
    //   if(result.toString().contains('.')) {
    //     List<String> splitDecimal = result.toString().split('.');
    //     if(!(int.parse(splitDecimal[1]) > 0))
    //       return result = splitDecimal[0].toString();
    //   }
    //   return result;
    // }
  }
}
