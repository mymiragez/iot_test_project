// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShowAir3LinegraphUI extends StatefulWidget {
  const ShowAir3LinegraphUI({super.key});

  @override
  State<ShowAir3LinegraphUI> createState() => _ShowAir3LinegraphUIState();
}

class _ShowAir3LinegraphUIState extends State<ShowAir3LinegraphUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'กราฟเส้นแอร์ตัวที่ 3',
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
