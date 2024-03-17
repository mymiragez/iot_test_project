// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/views/home_ui.dart';
import 'package:iot_test_project/views/register_ui.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool pwdShow = true;

  TextEditingController usernameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

//สร้างเมธอดแสดง Warning Message
  showWarningMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context, // show ที่หน้าจอดัวเอง (context)
      builder: (context) => AlertDialog(
        //Show แบบ Alert
        title: Text(
          'คำเตือน',
          style: GoogleFonts.kanit(),
          textAlign: TextAlign.center,
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(),
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(),
            ),
          ),
        ],
      ),
    );
  }

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
                  controller: usernameCtrl,
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
                  controller: passwordCtrl,
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
                  onPressed: () {
                    //validate
                    if (usernameCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนชื่อผู้ใช้ด้วย..!!!");
                    } else if (passwordCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนรหัสผ่านด้วย..!!!");
                    } else {
                      //ส่งข้อมูลไปที่ Server เพื่อบันทึก ผ่าน API
                      User user = User(
                        userName: usernameCtrl.text,
                        userPassword: passwordCtrl.text,
                      );
                      CallApi.checkLogin(user).then(
                        (value) => {
                          if (value.message == "1") //ถ้า Callapi return เป็น data ต้องมี .message
                            {
                              //login สำเร็จ เปิดหน้าจอ HomeUI
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeUI(
                                    user: value,
                                  ),
                                ),
                              ),
                            }
                          else
                            {
                              //ไม่สำเร็จจะแสดง msg บอก
                              showWarningMessage(context, 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'),
                            },
                        },
                      );
                    }
                  },
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
