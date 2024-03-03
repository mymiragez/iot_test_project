// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/views/register_ui.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool pwdShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'IoT SAU 2024',
          style: GoogleFonts.kanit(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'เข้าใช้งานแอปพลิเคชั่น',
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: const Color.fromARGB(255, 134, 13, 5),
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'username',
                    labelText: 'ฃื่อผู้ใช้',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  obscureText: pwdShow,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'password',
                    labelText: 'รหัสผ่าน',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            // มีผลต่อการแสดงผลต้องใช้ setState
                            if (pwdShow == true) {
                              pwdShow = false;
                            } else {
                              pwdShow = true;
                            }
                          },
                        );
                      },
                      icon: Icon(
                        //ternary operator ----> ____? ____: ______ มีเครื่องหมาย ? กับ : ถ้าข้างหน้าเป็นจริงจะได้หลัง? ถ้าไม่เป็นจริงจะได้หลัง :
                        pwdShow ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 134, 13, 5),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have account?    ',
                      style: GoogleFonts.kanit(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                    //GestureDetector() จะไม่มี effect เหมือน inkwell
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterUI(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: const Color.fromARGB(255, 134, 13, 5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
