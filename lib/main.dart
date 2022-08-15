import 'package:connecten/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConnecTen',
      theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme,
      )),
      home: LoginPage(),
    );
  }
}
