// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_test_project/services/call_api.dart';

class UpdateProfileUI extends StatefulWidget {
  User? user;
  UpdateProfileUI({super.key, this.user});

  @override
  State<UpdateProfileUI> createState() => _UpdateProfileUIState();
}

class _UpdateProfileUIState extends State<UpdateProfileUI> {
  TextEditingController fullnameCtrl = TextEditingController(text: '');
  TextEditingController usernameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');
  TextEditingController confirmpasswordCtrl = TextEditingController(text: '');
  TextEditingController ageCtrl = TextEditingController(text: '');

//Method Warning Message
  showWarningMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
          style: GoogleFonts.kanit(),
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
          )
        ],
      ),
    );
  }

  showInformationMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'ผลการทำงาน',
          style: GoogleFonts.kanit(),
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
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    fullnameCtrl.text = widget.user!.userFullname!;
    usernameCtrl.text = widget.user!.userName!;
    passwordCtrl.text = widget.user!.userPassword!;
    confirmpasswordCtrl.text = widget.user!.userPassword!;
    ageCtrl.text = widget.user!.userAge!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'แก้ไข Profile',
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
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'ข้อมูลผู้ใช้งาน',
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      color: const Color.fromARGB(255, 134, 13, 5),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
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
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                    hintText: 'fullname',
                    labelText: 'ชื่อผู้-สกุล',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 134, 13, 5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                        color: const Color.fromARGB(255, 134, 13, 5),
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
                  height: MediaQuery.of(context).size.height * 0.02,
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
                        color: const Color.fromARGB(255, 134, 13, 5),
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
                        Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextField(
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
                        color: const Color.fromARGB(255, 134, 13, 5),
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
                        Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                        color: const Color.fromARGB(255, 134, 13, 5),
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
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //validate (UI) verify (Backend)
                    if (fullnameCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนชื่อ-สกุลด้วยขอรับ..!!!");
                    } else if (usernameCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนชื่อผู้ใช้ด้วยขอรับ..!!!");
                    } else if (passwordCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนรหัสผ่านด้วยขอรับ..!!!");
                    } else if (confirmpasswordCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนยืนยันรหัสผ่านด้วยขอรับ..!!!");
                    } else if (ageCtrl.text.isEmpty == true) {
                      showWarningMessage(context, "กรุณาป้อนอายุด้วยขอรับ..!!!");
                    } else if (passwordCtrl.text != confirmpasswordCtrl.text) {
                      showWarningMessage(context, "รหัสผ่านและยืนยันรหัสผ่านต้องตรงกันด้วยขอรับ..!!!");
                    } else {
                      //ส่งข้อมูลไปที่ Server เพื่อบันทึก ผ่าน API
                      //map date
                      User user = User(
                        userId: widget.user!.userId!,
                        userFullname: fullnameCtrl.text,
                        userName: usernameCtrl.text,
                        userPassword: passwordCtrl.text,
                        userAge: ageCtrl.text,
                      );
                      CallApi.updateUser(user).then((value) => {
                            if (value == "1")
                              {
                                //แปลว่าบันทึกสำเร็จกลับไปหน้า Login
                                showInformationMessage(context, "บันทึกการแก้ไขสำเร็จ").then((value) => {
                                      Navigator.pop(context, user),
                                    }),
                              }
                            else
                              {
                                //ไม่สำเร็จจะแสดง Warning Message
                                showWarningMessage(context, "บันทึกการแก้ไขไม่สำเร็จกรุณาลองใหม่อีกครั้ง"),
                              }
                          });
                    }
                  },
                  child: Text(
                    'บันทึกการแก้ไขข้อมูลผู้ใช้งาน',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 134, 13, 5),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 81, 68),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
