// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/views/splash_screen_ui.dart';

void main() {
  runApp(
    MyIoTApp(),
  );
}

//-------------------------

class MyIoTApp extends StatefulWidget {
  const MyIoTApp({super.key});

  @override
  State<MyIoTApp> createState() => _MyIoTAppState();
}

class _MyIoTAppState extends State<MyIoTApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
