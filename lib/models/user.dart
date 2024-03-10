// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class User {
  String? message;
  String? userId;
  String? userFullname;
  String? userName;
  String? userPassword;
  String? userAge;

  User({this.message, this.userId, this.userFullname, this.userName, this.userPassword, this.userAge});

//ข้อมูล JSON จาก Server มาเป็นข้อมูลที่ใช้ในแอปฯ
  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userFullname = json['userFullname'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userAge = json['userAge'];
  }
//จากข้อมูลในแอป แปลงเป็น JSON เพื่อส่งไป Server
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['userFullname'] = this.userFullname;
    data['userName'] = this.userName;
    data['userPassword'] = this.userPassword;
    data['userAge'] = this.userAge;
    return data;
  }
}
