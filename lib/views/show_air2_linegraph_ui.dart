// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShowAir2LinegraphUI extends StatefulWidget {
  const ShowAir2LinegraphUI({super.key});

  @override
  State<ShowAir2LinegraphUI> createState() => _ShowAir2LinegraphUIState();
}

class _ShowAir2LinegraphUIState extends State<ShowAir2LinegraphUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'กราฟเส้นแอร์ตัวที่ 2',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
