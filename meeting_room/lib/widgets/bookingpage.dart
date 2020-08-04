import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            child: Row(
          children: <Widget>[
            Container(
              child: Table(children: _buildTableColumnOne()),
              width: numRowWidth, //固定第一列
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Table(children: _buildTableRow()),
                      width: numRowWidth * 6,
                    )))
          ],
        )));
  }

//创建第一列行

  double numRowWidth = 100.0; //单个表宽
  double numRowHeight = 48.0; //表格高

  List<TableRow> _buildTableColumnOne() {
    List<TableRow> returnList = new List();
    returnList.add(_buildSingleColumnOne(-1));
    for (int i = 0; i < 5; i++) {
      returnList.add(_buildSingleColumnOne(i));
    }
    return returnList;
  }

//创建tableRows
  List<TableRow> _buildTableRow() {
    List<TableRow> returnList = new List();
    returnList.add(_buildSingleRow(-1));
    for (int i = 0; i < 5; i++) {
      returnList.add(_buildSingleRow(i));
    }
    return returnList;
  }

  //创建第一列tableRow
  TableRow _buildSingleColumnOne(int index) {
    return TableRow(
        //第一行样式 添加背景色
        children: [
          //增加行高
          _buildSideBox(index == -1 ? '纸品种类' : "黄边纸", index == -1),
        ]);
  }

//创建一行tableRow
  TableRow _buildSingleRow(int index) {
    return TableRow(
        //第一行样式 添加背景色
        children: [
          _buildSideBox(index == -1 ? '实重' : "2676.30", index == -1),
          _buildSideBox(index == -1 ? '金额' : "100.30", index == -1),
          _buildSideBox(index == -1 ? '扣重' : "100", index == -1),
          _buildSideBox(index == -1 ? '单价(元/kg)' : "11640", index == -1),
          _buildSideBox(index == -1 ? '磅重(kg)' : "45", index == -1),
        ]);
  }

  //创建单个表格
  Widget _buildSideBox(String title, isTitle) {
    return SizedBox(
        height: numRowHeight,
        width: numRowWidth,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.33, color: Color(0xff757575)))),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: isTitle ? 14 : 12, color: Color(0xff757575)),
            )));
  }
}
