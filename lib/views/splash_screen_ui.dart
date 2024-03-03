// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/views/login_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 245, 233),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'IoT SAU 2024',
              style: GoogleFonts.kanit(
                textStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.026, color: Color.fromARGB(255, 19, 9, 156)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Create By : Ekkanut SAU',
              style: GoogleFonts.kanit(
                textStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015, color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
