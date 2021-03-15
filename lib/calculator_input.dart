import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

// enum NumberType { one, two, three, four, five, six, seven, eight, nine, zero }

class CalculatorInput extends StatefulWidget {
  @override
  _CalculatorInputState createState() => _CalculatorInputState();
}

class _CalculatorInputState extends State<CalculatorInput> {
  // List<int> list = [];
  //
  // int calc(a, b) {
  //   return (a * b);
  // }

  dynamic textSelected = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operation = '';
  dynamic preOperation = '';

  String containDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return containDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return containDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return containDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return containDecimal(result);
  }

  void calculation(textBtn) {
    if (textBtn == 'AC') {
      textSelected = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      operation = '';
      preOperation = '';
    } else if (operation == '=' && textBtn == '=') {
      if (preOperation == '+') {
        finalResult = add();
      } else if (preOperation == '-') {
        finalResult = sub();
      } else if (preOperation == 'x') {
        finalResult = mul();
      } else if (preOperation == '÷') {
        finalResult = div();
      }
    } else if (textBtn == '+' ||
        textBtn == '-' ||
        textBtn == 'x' ||
        textBtn == '÷') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (operation == '+') {
        finalResult = add();
      } else if (operation == '-') {
        finalResult = sub();
      } else if (operation == 'x') {
        finalResult = mul();
      } else if (operation == '/') {
        finalResult = div();
      }

      preOperation = operation;
      operation = textBtn;
      result = '';
    } else if (textBtn == '%') {
      result = numOne / 100;
      finalResult = containDecimal(result);
    } else if (textBtn == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (textBtn == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + textBtn;
      finalResult = result;

      setState(() {
        textSelected = finalResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 140.0,
              height: 52.00,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0XFF292D36).withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.sun,
                    size: 25.0,
                    color: Color(0XFF76787E),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    FontAwesomeIcons.moon,
                    size: 25.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textSelected,
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                // Text(
                                //   ' x ',
                                //   style: TextStyle(
                                //       color: redColor, fontSize: 30.0),
                                // ),
                                // Text(
                                //   '2',
                                //   style: TextStyle(fontSize: 30.0),
                                // )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '12,936',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ))
                        ],
                      ),
                      // color: Colors.blue,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5.0, top: 30.0, end: 5.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0XFF292D36).withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                'AC',
                                style:
                                    TextStyle(fontSize: 30.0, color: tealColor),
                                textAlign: TextAlign.center,
                              ),
                              // style: ButtonStyle(sha),
                              onPressed: () {
                                print('AC');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '+/-',
                                style:
                                    TextStyle(fontSize: 30.0, color: tealColor),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                print('+/-');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '%',
                                style:
                                    TextStyle(fontSize: 30.0, color: tealColor),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                print('%');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '÷',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w400,
                                    color: redColor),
                              ),
                              onPressed: () {
                                print('÷');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                '7',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  // calc(8, 7);
                                  // print(arr);
                                  // selected = NumberType.seven;
                                });
                              },
                            ),
                            TextButton(
                              child: Text(
                                '8',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                // print('8');
                                setState(() {
                                  // selected = NumberType.eight;
                                });
                              },
                            ),
                            TextButton(
                              child: Text(
                                '9',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('9');
                              },
                            ),
                            TextButton(
                              child: Text(
                                'x',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: redColor),
                              ),
                              onPressed: () {
                                // print('x');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                '4',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('4');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('5');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '6',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('6');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '-',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: redColor),
                              ),
                              onPressed: () {
                                print('-');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('1');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('2');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('3');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '+',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: redColor),
                              ),
                              onPressed: () {
                                print('+');
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 20.0,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              child: Icon(
                                FontAwesomeIcons.undo,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('0');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                print('.');
                              },
                            ),
                            TextButton(
                              child: Text(
                                '=',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,
                                    color: redColor),
                              ),
                              onPressed: () {
                                print('=');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
    ));
  }
}
