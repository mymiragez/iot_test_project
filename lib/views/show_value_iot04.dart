// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types, unnecessary_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iot_test_project/models/roomtemp.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ShowValueIOT04 extends StatefulWidget {
  const ShowValueIOT04({super.key});

  @override
  State<ShowValueIOT04> createState() => _ShowValueIOT04State();
}

class _ShowValueIOT04State extends State<ShowValueIOT04> {
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

  //เมธอดเรียกใช้ฟั เมธอดที่เรียกใช้ API //เมธอด CallAPIGetAllRoomtemp เรียกใช้ เมธอดgetAllRoomTemp
  Future CallAPIGetAllRoomtemp() async {
    var dataFromCallAPI = await CallApi.getAllRoomTemp();
    return showTableDetail(dataFromCallAPI);
  }

  //เมธอดสร้าง ตัวตารางที่จะเอาข้อมูลมาแสดง
  List<GridColumn> createHeadTable() {
    return <GridColumn>[
      GridColumn(
        columnName: 'temp3',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'แอร์ตัวที่ 3',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'datesave',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'วันที่',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'timesave',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'เวลา',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 13, 5),
        title: Text(
          'ข้อมูลแอร์ตัวที่ 3',
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
            SizedBox(
              height: 25.0,
            ),
            Text(
              'ข้อมูลแอร์ตัวที่ 3',
              style: TextStyle(fontSize: 25.0, color: const Color.fromARGB(255, 134, 13, 5)),
            ),
            Text(
              '-- แสดงข้อมูลแอร์ที่ 3 วัน และเวลา --',
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: FutureBuilder(
                  future: CallAPIGetAllRoomtemp(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'มีข้อผิดพลาดเกิดขึ้น กรุณาตรวจสอบการเชื่อมต่อ Internet หรือลองใหม่อีกครั้ง',
                        ),
                      );
                    } else {
                      return SfDataGridTheme(
                        data: SfDataGridThemeData(
                          headerColor: Colors.grey,
                        ),
                        child: SfDataGrid(
                          source: snapshot.data,
                          columns: createHeadTable(),
                          columnWidthMode: ColumnWidthMode.fill,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'ข้อมูล ณ วันที่ ${DateTime.now().day} ${showThaiMonth(DateTime.now().month)} พ.ศ. ${DateTime.now().year + 543}',
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

//***************************************************************
//สร้าง Class ที่ใช้สร้างรายละเอียดของตัวตาราง
class showTableDetail extends DataGridSource {
  //--------1
  late List<DataGridRow> dataGridRow;
  late List<Roomtemp> dataShow;
  //--------2
  showTableDetail(this.dataShow) {
    buildDataGridRow();
  }
  //--------3
  buildDataGridRow() {
    dataGridRow = dataShow.map<DataGridRow>(
      (dataGridRowItem) {
        return DataGridRow(
          cells: [
            DataGridCell(columnName: 'temp3', value: dataGridRowItem.temp3),
            DataGridCell(columnName: 'datasave', value: dataGridRowItem.datesave),
            DataGridCell(columnName: 'timesave', value: dataGridRowItem.timesave),
          ],
        );
      },
    ).toList(growable: false);
  }

  //--------4
  @override
  List<DataGridRow> get rows => dataGridRow;

  //--------5 อ้างอิงจากส่วนที่ 3
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      //แสดงสีของตารางสีเว้นสีในแต่ละแถว
      color: effectiveRows.indexOf(row) % 2 == 0 ? Colors.transparent : Colors.red[100],

      //--
      cells: [
        Container(
          child: Text(
            row.getCells()[0].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
        ),
        Container(
          child: Text(
            row.getCells()[1].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
        ),
        Container(
          child: Text(
            row.getCells()[2].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
        ),
      ],
    );
  }
}
