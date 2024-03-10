// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:iot_test_project/services/call_api.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  //สร้าง object ควบคุม textField( อย่าลืมไปผูกกับ TextField)
  TextEditingController fullnameCtrl = TextEditingController(text: '');
  TextEditingController usernameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');
  TextEditingController confirmpasswordCtrl = TextEditingController(text: '');
  TextEditingController ageCtrl = TextEditingController(text: '');

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

  showInformationMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context, // show ที่หน้าจอดัวเอง (context)
      builder: (context) => AlertDialog(
        //Show แบบ Alert
        title: Text(
          'ผลการทำงาน',
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
          'ลงทะเบียน',
          style: GoogleFonts.kanit(
            textStyle: TextStyle(
              color: Colors.white,
            ),
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'ข้อมูลผู้ใช้งาน',
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
                  controller: fullnameCtrl,
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
                    hintText: 'userfullname',
                    labelText: 'ชื่อ-สกุล',
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
                    labelText: 'ชื่อผู้ใช้',
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
                  controller: passwordCtrl,
                  obscureText: true,
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
                      onPressed: () {},
                      icon: Icon(
                        //ternary operator ----> ____? ____: ______ มีเครื่องหมาย ? กับ : ถ้าข้างหน้าเป็นจริงจะได้หลัง? ถ้าไม่เป็นจริงจะได้หลัง :
                        Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  //confirm password
                  controller: confirmpasswordCtrl,
                  obscureText: true,
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
                    hintText: 'confirm password',
                    labelText: 'ยืนยันรหัสผ่าน',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        //ternary operator ----> ____? ____: ______ มีเครื่องหมาย ? กับ : ถ้าข้างหน้าเป็นจริงจะได้หลัง? ถ้าไม่เป็นจริงจะได้หลัง :
                        Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
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
                    hintText: 'Age',
                    labelText: 'อายุ',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ElevatedButton(
                  onPressed: () {
                    //validate (คำที่ใช้กับ ui)ตรวจสอบเบื้องต้น
                    if (fullnameCtrl.text.isEmpty == true) {
                      showWarningMessage(context, 'กรุณาป้อนชื่อ-สกุลด้วยนะจ๊ะ...');
                    } else if (usernameCtrl.text.isEmpty == true) {
                      showWarningMessage(context, 'กรุณาป้อนชื่อผู้ใช้ด้วยนะจ๊ะ...');
                    } else if (passwordCtrl.text.isEmpty == true) {
                      showWarningMessage(context, 'กรุณาป้อนรหัสผ่านด้วยนะจ๊ะ...');
                    } else if (confirmpasswordCtrl.text.isEmpty == true) {
                      showWarningMessage(context, 'กรุณาป้อนยืนยันรหัสผ่านด้วยนะจ๊ะ...');
                    } else if (ageCtrl.text.isEmpty == true) {
                      showWarningMessage(context, 'กรุณาอายุด้วยนะจ๊ะ...');
                    } else if (passwordCtrl.text != confirmpasswordCtrl.text) {
                      showWarningMessage(context, 'รหัสผ่านและยืนยันรหัสผ่านต้องตรงกัน...');
                    } else {
                      //ส่งข้อมูลที่ป้อนไปที่ Server เพื่อบันทึก ผ่านทางการเรียกใช้ API
                      User user = User(
                        userFullname: fullnameCtrl.text,
                        userName: usernameCtrl.text,
                        userPassword: passwordCtrl.text,
                        userAge: ageCtrl.text,
                      ); //User
                      //เรียก API
                      CallApi.insertUser(user).then(
                        (value) => {
                          if (value == "1")
                            {
                              //แปลว่าบันทึกสำเร็จ จะกลับไปหน้า login
                              showInformationMessage(context, 'บันทึกสำเร็จ').then(
                                (value) => {
                                  Navigator.pop(
                                    context,
                                  ),
                                },
                              ),
                            }
                          else
                            {
                              //ไม่สำเร็จจะแสดง msg บอก
                              showWarningMessage(context, 'บันทึกไม่สำเร็จกรุณาลองใหม่อีกครั้ง...'),
                            },
                        },
                      );
                    }
                  },
                  child: Text(
                    'บันทึกข้อมูลลงทะเบียนผู้ใช้งาน',
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
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'ยกเลิก',
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
                    backgroundColor: const Color.fromARGB(255, 255, 81, 68),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
