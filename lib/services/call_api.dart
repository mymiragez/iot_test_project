//เป็นคลาสที่ประกอบด้วยเมธอดที่จะใช้ติดต่อกั้บ Server เพื่อเรียกใช้ API ที่ Server
// ignore_for_file: void_checks, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:async';
import 'package:iot_test_project/models/roomtemp.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:iot_test_project/utils/host.dart';

class CallApi {
  //เมธอดเรียก API เพื่อเพิ่มข้อมูล User
  static Future insertUser(User user) async {
    //คำสั่งเรียกใช้ API ที่ Server
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/user/insert_user_api.php",
      ),
      body: jsonEncode(user.toJson()),
      headers: {'content-Type': 'application/json'},
    );
//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      throw Exception('Fail ...');
    }
  }

  //เมธอดเรียก API เพื่อตรวจสอบชื่อผู้ใช้ รหัสผ่านในการเข้าใช้งาน APP
  static Future checkLogin(User user) async {
    //คำสั่งเรียกใช้ API ที่ Server
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/user/check_login_user_api.php",
      ),
      body: jsonEncode(user.toJson()),
      headers: {'content-Type': 'application/json'},
    );
//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลที่มาเป็น JSON เป็นข้อมูลที่จะนำไปใช้ใน App

      //***************
      // แปลงเป็น list เพราะหลายคนใช้กับ login ไม่ได้
      /*
      final data = await responseData.map<User>((json) {
        return User.fromJson(json);
      }).toList();*/
      //****************

      final data = User.fromJson(responseData);
      return data;
    } else {
      throw Exception('Fail ...');
    }
  }

//เมธอดเรียก API แก้ไขข้อมูลส่วนตัว

  static Future updateUser(User user) async {
    //คำสั่งเรียกใช้ API ที่ Server
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/user/update_user_api.php",
      ),
      body: jsonEncode(user.toJson()),
      headers: {'content-Type': 'application/json'},
    );
//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      throw Exception('Fail ...');
    }
  }

//เมธอดเรียก API เพื่อดึงข้อมูลค่า Sensor จากตาราง roomtemp_tb มาแสดงเป็นตาราง กราฟแท่งเส้น

//เมธอดเรียก API เพื่อแก้ไขค่า Sensor ที่ผิด

//เมธอดเรียก API เพื่อลบค่า Sensor ที่ผิด

//เมธอดเรียก API เพื่อกำหนดค่าการเปิดปิดอุปกรณ์ใด ๆ เช่น เปิดปิดไฟ เปิดปิดสวิตซ์

//เมธอดเรียก API เพื่อดึงข้อมูลอุณหภูมิทั้งหมด //List เพราะส่งข้อมูลหลายตัว ไม่แสดงแค่อย่างเดียวแบบ user
  static Future<List<Roomtemp>> getAllRoomTemp() async {
//คำสั่งเรียกใช้ API ที่ Server โดยผลจากการเรียกใช้จะเก็บในตัวแปร
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/roomtemp/get_all_roomtemp_api.php",
      ),
      headers: {'content-Type': 'application/json'},
    );

//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      //print(responseData);

      //แปลงข้อมูลที่มาเป็น Json เป็นข้อมูลที่จะนำไปใช้ใน APP
      List<Roomtemp> data = await responseData.map<Roomtemp>((json) => Roomtemp.fromJson(json)).toList();

      return data;
    } else {
      throw Exception('Fail ...');
    }
  }

//เมธอดเรียก API เพื่อดึงข้อมูลอุณหภูมิแอร์ตัวที่ 1 //List เพราะส่งข้อมูลหลายตัว ไม่แสดงแค่อย่างเดียวแบบ user
  static Future<List<Roomtemp>> getAllTemp1() async {
//คำสั่งเรียกใช้ API ที่ Server โดยผลจากการเรียกใช้จะเก็บในตัวแปร
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/roomtemp/get_all_temp_1_api.php",
      ),
      headers: {'content-Type': 'application/json'},
    );

//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      //print(responseData);

      //แปลงข้อมูลที่มาเป็น Json เป็นข้อมูลที่จะนำไปใช้ใน APP
      List<Roomtemp> data = await responseData.map<Roomtemp>((json) => Roomtemp.fromJson(json)).toList();

      return data;
    } else {
      throw Exception('Fail ...');
    }
  }

//เมธอดเรียก API เพื่อดึงข้อมูลอุณหภูมิแอร์ตัวที่ 1 //List เพราะส่งข้อมูลหลายตัว ไม่แสดงแค่อย่างเดียวแบบ user
  static Future<List<Roomtemp>> getAllTemp2() async {
//คำสั่งเรียกใช้ API ที่ Server โดยผลจากการเรียกใช้จะเก็บในตัวแปร
    //insert ใช้ post, update ใช้ put,delete ใช้ delete, นอกเหนือใช้ get
    final response = await http.post(
      Uri.parse(
        Host.hostUrl + "/iotsau01api/apis/roomtemp/get_all_temp_2_api.php",
      ),
      headers: {'content-Type': 'application/json'},
    );

//ตรวจสอบผลการเรียกใช้งานพร้อมส่งค่าผลการเรียกใช้งานกลับไปยังจุดเรียกใช้
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      //print(responseData);

      //แปลงข้อมูลที่มาเป็น Json เป็นข้อมูลที่จะนำไปใช้ใน APP
      List<Roomtemp> data = await responseData.map<Roomtemp>((json) => Roomtemp.fromJson(json)).toList();

      return data;
    } else {
      throw Exception('Fail ...');
    }
  }
}
