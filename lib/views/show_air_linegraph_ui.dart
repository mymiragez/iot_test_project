// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_if_null_operators, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:iot_test_project/models/roomtemp.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowAirLinegraphUI extends StatefulWidget {
  const ShowAirLinegraphUI({super.key});

  @override
  State<ShowAirLinegraphUI> createState() => _ShowAirLinegraphUIState();
}

class _ShowAirLinegraphUIState extends State<ShowAirLinegraphUI> {
  String? dateSelected = 'ปี-เดือน-วัน';

//เมธอดแสดงปฏิทิน
  Future showCalendar() async {
    DateTime? datetime = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    //หลังจากเลือกให้เอาวันที่ไปกำหนดให้กับ dataSelected
    if (datetime != null) {
      setState(
        () {
          //dateSelected = datetime.toString();
          dateSelected = DateFormat('yyyy-MM-dd').format(datetime);
          flag = 0;

          // showThaiDate = 'วันที่ ${datetime.day.toString()} ${showThaiMonth(datetime.month)} ${datetime.year + 543}';
          showThaiDate = 'วันที่ ' + datetime.day.toString() + ' ' + showThaiMonth(datetime.month) + ' ' + (543 + datetime.year).toString();
        },
      );
    }
  }

//เมธอดเรียก API เพื่อนำข้อมูลมาแสดงเป็นกราฟ
  Future<List<Roomtemp>> _getAir1DateAPI() async {
    //print(dateSelected);
    return await CallApi.getAirDate(
      Roomtemp(datesave: dateSelected),
    );
  }

/*
//เมธอดสร้างกราฟ
  bulidGraph() async {
    return FutureBuilder<List<Roomtemp>>(
      future: _getAir1DateAPI(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error.....');
        } else {
          //สร้างกราฟ
          return SfCartesianChart(
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: 'เวลา'),
            ),
            primaryYAxis: NumericAxis(
              title: AxisTitle(
                text: 'อุณหภูมิ',
              ),
            ),
            series: <LineSeries>[
              LineSeries<Roomtemp, String>(
                xValueMapper: (Roomtemp data, _) => data.timesave ?? '',
                yValueMapper: (Roomtemp data, _) => data.temp1 ?? 0,
                name: 'Temperature',
                dataLabelSettings: DataLabelSettings(isVisible: true),
                markerSettings: MarkerSettings(isVisible: true),
              ),
            ],
          );
        }
      },
    );
  }
*/
  //เมธอดแปลงเดือนเป็นภาษาไทย
  String showThaiMonth(month) {
    switch (month) {
      case 1:
        return 'มกราคม';
      case 2:
        return 'กุมภาพันธ์';
      case 3:
        return 'มีนาคม';
      case 4:
        return 'เมษายน';
      case 5:
        return 'พฤษภาคม';
      case 6:
        return 'มิถุนายน';
      case 7:
        return 'กรกฎาคม';
      case 8:
        return 'สิงหาคม';
      case 9:
        return 'กันยายน';
      case 10:
        return 'ตุลาคม';
      case 11:
        return 'พฤศจิกายน';
      default:
        return 'ธันวาคม';
    }
  }

//สร้างตัวแปรเพื่อใช้ควบคุมการแสดงกราฟ
  int flag = 1;
  String showThaiDate = 'โปรดเลือกวันที่ที่ต้องการ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'กราฟเส้นแอร์',
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'วันที่ ',
                ),
                Text(
                  dateSelected!,
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showCalendar();
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),
            Text(
              showThaiDate,
              style: TextStyle(
                color: Colors.blue[800],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                  bottom: 30.0,
                ),
                child: flag == 1
                    ? Container(
                        color: Colors.transparent,
                      )
                    : FutureBuilder<List<Roomtemp>>(
                        future: _getAir1DateAPI(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error.....');
                          } else {
                            //สร้างกราฟ
                            return snapshot.data![0].message == '0'
                                ? Text('ไ่ม่มีข้อมูล')
                                : SfCartesianChart(
                                    primaryXAxis: CategoryAxis(
                                      title: AxisTitle(text: 'เวลา'),
                                      labelRotation: -45,
                                    ),
                                    primaryYAxis: NumericAxis(
                                      title: AxisTitle(
                                        text: 'อุณหภูมิ',
                                      ),
                                      labelFormat: '{value}°C',
                                    ),
                                    title: ChartTitle(text: 'Temperature Chart of AIR'),
                                    legend: Legend(isVisible: true),
                                    palette: <Color>[Color.fromARGB(255, 0, 166, 255), const Color.fromARGB(255, 255, 0, 115), Color.fromARGB(255, 115, 255, 0)],
                                    series: <LineSeries>[
                                      //type Chart
                                      LineSeries<Roomtemp, String>(
                                        dataSource: snapshot.data!,
                                        xValueMapper: (Roomtemp data, _) => data.timesave ?? '',
                                        yValueMapper: (Roomtemp data, _) => data.temp1 ?? 0,
                                        name: 'Air 1',
                                        dataLabelSettings: DataLabelSettings(isVisible: true),
                                        markerSettings: MarkerSettings(isVisible: true),
                                      ),
                                      LineSeries<Roomtemp, String>(
                                        dataSource: snapshot.data!,
                                        xValueMapper: (Roomtemp data, _) => data.timesave ?? '',
                                        yValueMapper: (Roomtemp data, _) => data.temp2 ?? 0,
                                        name: 'Air 2',
                                        dataLabelSettings: DataLabelSettings(isVisible: true),
                                        markerSettings: MarkerSettings(isVisible: true),
                                      ),
                                      LineSeries<Roomtemp, String>(
                                        dataSource: snapshot.data!,
                                        xValueMapper: (Roomtemp data, _) => data.timesave ?? '',
                                        yValueMapper: (Roomtemp data, _) => data.temp3 ?? 0,
                                        name: 'Air 3',
                                        dataLabelSettings: DataLabelSettings(isVisible: true),
                                        markerSettings: MarkerSettings(isVisible: true),
                                      ),
                                    ],
                                  );
                          }
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
