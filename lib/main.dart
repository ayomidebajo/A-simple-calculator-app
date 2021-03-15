import 'package:calculator/calculator_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: Size(60.0, 60.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: Colors.white10,
            ),
          ),
          primaryColor: Color(0XFFF22252D),
          accentColor: Colors.purple,
          scaffoldBackgroundColor: Color(0XFFF22252D).withOpacity(0.9)),
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorInput(),
      },
    );
  }
}
