// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class Roomtemp {
  String? message;
  int? roomtempId;
  double? temp1;
  double? temp2;
  double? temp3;
  String? datesave;
  String? timesave;

  Roomtemp({this.message, this.roomtempId, this.temp1, this.temp2, this.temp3, this.datesave, this.timesave});

  Roomtemp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    roomtempId = json['roomtempId'];
    temp1 = double.parse(json['temp1']);
    temp2 = double.parse(json['temp2']);
    temp3 = double.parse(json['temp3']);
    datesave = json['datesave'];
    timesave = json['timesave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['roomtempId'] = this.roomtempId;
    data['temp1'] = this.temp1;
    data['temp2'] = this.temp2;
    data['temp3'] = this.temp3;
    data['datesave'] = this.datesave;
    data['timesave'] = this.timesave;
    return data;
  }
}
