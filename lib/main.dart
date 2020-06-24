import 'package:flutter/material.dart';

import './home.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "personal Expenses",
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amberAccent,
        fontFamily: "PTSans",
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6 : TextStyle(
            fontFamily: "PTSans",
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 25,
            )
          )
        ),


      ),
    );
  }
}
