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
  dynamic selected = "";
  dynamic num = "";
  dynamic numOne = 0;
  dynamic numTwo = 0;
  dynamic symbol = "";
  dynamic result = "";
  dynamic output = "";

  List selectedList = <String>[];
  String selectedString = "";

  bool onTap = false;

  receiveTap(onTap, String no) {
    if (onTap = true) {
      print('yes, i was clicked!');
      selectedList.add(no);
      if (no == "=") {
        selectedList.removeWhere((element) => element.contains("="));
      }

      print({selectedList.join(''), 'checks'});

      num = selectedList.join('');

      if (no == 'AC') {
        num = '';
        numOne = 0;
        numTwo = 0;
        output = '';
        result = "";
        symbol = "";
        selectedList = [];
        print('$num, checking empty');
      } else if (no == '+' || no == "-" || no == "÷" || no == "x") {
        numOne = double.parse(result);
        print('$numOne, checking number one');
        symbol = no;
        output = "";
      } else if (no == ".") {
        if (output.contains(".")) {
          print('Already contains');
          return;
        } else {
          output = output + no;
        }
      } else if (no == "=") {
        numTwo = double.parse(result);
        print('$numTwo, checking number two');
        // num.remove("=");

        if (symbol == "+") {
          output = (numOne + numTwo).toString();
        }
        if (symbol == "-") {
          output = (numOne - numTwo).toString();
        }
        if (symbol == "x") {
          output = (numOne * numTwo).toString();
        }
        if (symbol == "÷") {
          output = (numOne / numTwo).toString();
        }

        numOne = 0;
        numTwo = 0;
        symbol = "";
      } else if (no == "%") {
        dynamic percent;
        percent = num.split('%');
        output = int.parse(percent[0]) / 100;
      } else {
        output = output + no;
      }

      String containDecimal(dynamic out) {
        if (out.toString().contains('.')) {
          List<String> splitDecimal = out.toString().split('.');

          if (!(int.parse(splitDecimal[1]) > 0)) {
            out = splitDecimal[0].toString();
          }
          if (!(int.parse(splitDecimal[1]) > 0 &&
              (int.parse(splitDecimal[2])) > 0)) {
            out = splitDecimal[0].toString();
            print('$out with the stuff1');
          }

          output = out;
        }
        return output;
      }

      print('$output kilo shele');
      // containDecimal(output);

      setState(() {
        result = output;
      });

      print(output.runtimeType);

      // if (output.contains('.') && output.lastIndexOf('0')) {
      //   print('$output, amebo');
      // }
    }
  }

  // resultFunction(String a) {
  //   print('$a what happen');
  //   if (a.contains('-')) {
  //     print('$a it subtract');
  //     print(a.split('-'));
  //     print(a.split('.'));
  //     List test = a.split('-');
  //     print(test.length);
  //     int firstValue = int.parse(test.firstWhere((i) => i.isNotEmpty));
  //
  //     String first = firstValue.toString();
  //
  //     if (first.contains('.')) {
  //       print(first.split('.'));
  //       double.parse(first);
  //     }
  //     int secondValue =
  //         int.parse(test.lastWhere((element) => element.isNotEmpty));
  //     // int result;
  //
  //     // result = firstValue - secondValue;
  //
  //     print('$result, result don commot o');
  //   } else if (a.contains('+') || a.contains('.')) {
  //     print(a.split('+'));
  //     print(a.split('.'));
  //     List test = a.split('+');
  //     int firstValue = int.parse(test.firstWhere((i) => i.isNotEmpty));
  //     int secondValue =
  //         int.parse(test.lastWhere((element) => element.isNotEmpty));
  //
  //     result = firstValue + secondValue;
  //   } else if (a.contains('x') || a.contains('.')) {
  //     print(a.split('x'));
  //
  //     List test = a.split('x');
  //     int firstValue = int.parse(test.firstWhere((i) => i.isNotEmpty));
  //     int secondValue =
  //         int.parse(test.lastWhere((element) => element.isNotEmpty));
  //
  //     result = firstValue * secondValue;
  //   } else if (a.contains('÷') || a.contains('.')) {
  //     print(a.split('÷'));
  //     print(a.split('.'));
  //     List test = a.split('÷');
  //     int firstValue = int.parse(test.firstWhere((i) => i.isNotEmpty));
  //     int secondValue =
  //         int.parse(test.lastWhere((element) => element.isNotEmpty));
  //
  //     result = firstValue / secondValue;
  //   } else if (a.contains('%') || a.contains('.')) {
  //     print(a.split('%'));
  //     print(a.split('.'));
  //     List test = a.split('%');
  //     int firstValue =
  //         int.parse(test.firstWhere((element) => element.isNotEmpty));
  //
  //     result = firstValue / 100;
  //   } else if (a.contains('.')) {
  //     print(a.split('.'));
  //     List test = a.split('.');
  //     int firstValue =
  //         int.parse(test.firstWhere((element) => element.isNotEmpty));
  //     int secondValue = int.parse(test.lastWhere((e) => e.isNotEmpty));
  //
  //     print('$test checking decimals');
  //     if (a[1].contains('+')) {
  //       result = firstValue + secondValue;
  //     } else if (a[1].contains('-')) {}
  //   }
  //
  //   print("$a checking");
  // }

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
                                  num.toString(),
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                // Text(
                                //   symbol,
                                //   style: TextStyle(
                                //       color: redColor, fontSize: 30.0),
                                // ),
                                // Text(
                                //   numOne.toString(),
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
                                result.toString(),
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, "AC");
                                });
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
                                // print('+/-');
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '+/-');
                                });
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
                                // print('%');
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '%');
                                });
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
                                // print('÷');
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '÷');
                                });
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
                                  onTap = !onTap;
                                  receiveTap(onTap, '7');
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
                                  onTap = !onTap;
                                  receiveTap(onTap, '8');
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '9');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, 'x');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '4');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '5');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '6');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '-');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '1');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '2');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '3');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '+');
                                  // add(selected);
                                });
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
                            //TODO: clean up the code, make the text button resuable
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '0');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  receiveTap(onTap, '.');
                                });
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
                                setState(() {
                                  onTap = !onTap;
                                  // receiveTap(onTap, '=');
                                  receiveTap(onTap, "=");
                                });
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

  //Logic for calculating

  // dynamic textSelected = '0';
  // double numOne = 0;
  // double numTwo = 0;
  //
  // dynamic result = '';
  // dynamic finalResult = '';
  // dynamic operation = '';
  // dynamic preOperation = '';
  //
  // String containDecimal(dynamic result) {
  //   if (result.toString().contains('.')) {
  //     List<String> splitDecimal = result.toString().split('.');
  //     if (!(int.parse(splitDecimal[1]) > 0))
  //       return result = splitDecimal[0].toString();
  //   }
  //   return result;
  // }
  //
  // String add() {
  //   result = (numOne + numTwo).toString();
  //   numOne = double.parse(result);
  //   return containDecimal(result);
  // }
  //
  // String sub() {
  //   result = (numOne - numTwo).toString();
  //   numOne = double.parse(result);
  //   return containDecimal(result);
  // }
  //
  // String mul() {
  //   result = (numOne * numTwo).toString();
  //   numOne = double.parse(result);
  //   return containDecimal(result);
  // }
  //
  // String div() {
  //   result = (numOne / numTwo).toString();
  //   numOne = double.parse(result);
  //   return containDecimal(result);
  // }
  //
  // void calculation(textBtn) {
  //   if (textBtn == 'AC') {
  //     textSelected = '0';
  //     numOne = 0;
  //     numTwo = 0;
  //     result = '';
  //     finalResult = '';
  //     operation = '';
  //     preOperation = '';
  //   } else if (operation == '=' && textBtn == '=') {
  //     if (preOperation == '+') {
  //       finalResult = add();
  //     } else if (preOperation == '-') {
  //       finalResult = sub();
  //     } else if (preOperation == 'x') {
  //       finalResult = mul();
  //     } else if (preOperation == '÷') {
  //       finalResult = div();
  //     }
  //   } else if (textBtn == '+' ||
  //       textBtn == '-' ||
  //       textBtn == 'x' ||
  //       textBtn == '÷') {
  //     if (numOne == 0) {
  //       numOne = double.parse(result);
  //     } else {
  //       numTwo = double.parse(result);
  //     }
  //
  //     if (operation == '+') {
  //       finalResult = add();
  //     } else if (operation == '-') {
  //       finalResult = sub();
  //     } else if (operation == 'x') {
  //       finalResult = mul();
  //     } else if (operation == '/') {
  //       finalResult = div();
  //     }
  //
  //     preOperation = operation;
  //     operation = textBtn;
  //     result = '';
  //   } else if (textBtn == '%') {
  //     result = numOne / 100;
  //     finalResult = containDecimal(result);
  //   } else if (textBtn == '.') {
  //     if (!result.toString().contains('.')) {
  //       result = result.toString() + '.';
  //     }
  //     finalResult = result;
  //   } else if (textBtn == '+/-') {
  //     result.toString().startsWith('-')
  //         ? result = result.toString().substring(1)
  //         : result = '-' + result.toString();
  //     finalResult = result;
  //   } else {
  //     result = result + textBtn;
  //     finalResult = result;
  //
  //     setState(() {
  //       textSelected = finalResult;
  //     });
  //   }
  // }
}
