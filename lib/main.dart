import 'package:flutter/material.dart';
import 'package:aplikasi_laundry/page/lginorregis.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(25, 119, 155, 1),
          ),
          headline2: GoogleFonts.montserrat(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(11, 187, 167, 1),
          ),
          headline3: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(25, 119, 155, 1),
          ),
          headline4: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(11, 187, 167, 1),
          ),
          headline5: GoogleFonts.montserrat(
            fontSize: 11.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          headline6: GoogleFonts.montserrat(
            fontSize: 11.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          subtitle1: GoogleFonts.montserrat(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          subtitle2: GoogleFonts.montserrat(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      home: SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginOrRegis();
  }
}
