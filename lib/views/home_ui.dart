// ignore_for_file: unnecessary_import, depend_on_referenced_packages, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:iot_test_project/views/login_ui.dart';
import 'package:iot_test_project/views/show_value_iot01.dart';
import 'package:iot_test_project/views/show_value_iot02.dart';
import 'package:iot_test_project/views/show_value_iot03.dart';
import 'package:iot_test_project/views/show_value_iot04.dart';
import 'package:iot_test_project/views/update_profile_ui.dart';

class HomeUI extends StatefulWidget {
  //Variable? ? = ยอมให้มีค่า null (flutter have a null safety)
  User? user;
  HomeUI({super.key, this.user});

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
          'Home หน้าหลัก',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //exit(0); ออกจากแอพเลย
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginUI(),
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.red[100],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 3, 103),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/images/logo.png'),
                    radius: MediaQuery.of(context).size.width * 0.12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileUI(
                            user: widget.user,
                          ),
                        ),
                      ).then((value) => {
                            //ต้องตรวจสอบก่อนว่าย้อนกลับมาจากการกดปุ่มบันทึก หรือ ปุ่มย้อนกลับ
                            if (value != null)
                              {
                                setState(() {
                                  widget.user!.userId = value.userId;
                                  widget.user!.userFullname = value.userFullname;
                                  widget.user!.userName = value.userName;
                                  widget.user!.userPassword = value.userPassword;
                                  widget.user!.userAge = value.userAge;
                                }),
                              }
                          });
                    },
                    child: Text(
                      widget.user!.userFullname!,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: MediaQuery.of(context).size.height * 0.026,
                      ),
                    ),
                  ),
                  Text(
                    'อายุ ${widget.user!.userAge!} ปี',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowValueIOT01(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.air,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ข้อมูลแอร์ทั้งหมด\n(มีแอร์ 3 ตัว)',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            70,
                          ),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowValueIOT02(),
                                ),
                              );
                            },
                            child: Text(
                              'ข้อมูล\nแอร์ตัวที่ 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: Size(
                                double.infinity,
                                70,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowValueIOT03(),
                                ),
                              );
                            },
                            child: Text(
                              'ข้อมูล\nแอร์ตัวที่ 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: Size(
                                double.infinity,
                                70,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowValueIOT04(),
                                ),
                              );
                            },
                            child: Text(
                              'ข้อมูล\nแอร์ตัวที่ 3',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: Size(
                                double.infinity,
                                70,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Bar Chart\nBy Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 140, 115),
                              fixedSize: Size(
                                double.infinity,
                                70,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Line Chart\nBy Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 140, 115),
                              fixedSize: Size(
                                double.infinity,
                                70,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Bar Chart\nBy Air and Date',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            70,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Line Chart\nBy Air and Date',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            70,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
