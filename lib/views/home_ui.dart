// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/views/login_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'Home',
          style: GoogleFonts.kanit(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //exit
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginUI(),
                ),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
