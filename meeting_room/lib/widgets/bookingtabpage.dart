import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetingroom/models/meetingroom.dart';
import 'package:meetingroom/models/timeinterval.dart';

class BookingTabPage extends StatefulWidget {
  //BookingTabPage({Key key, this.title}) : super(key: key);
  //final String title;
  @override
  _BookingTabPageState createState() => _BookingTabPageState();
}

class _BookingTabPageState extends State<BookingTabPage> {
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: TabBar(
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black54,
                indicatorWeight: 1,
                isScrollable: true,
                // labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                labelStyle: TextStyle(fontSize: 14),
                tabs: <Widget>[
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab1'),
                  Tab(text: 'Tab1'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: <Widget>[
                  ListViewContnet(),
                  ListViewContnet(),
                  ListViewContnet(),
                  ListViewContnet(),
                  ListViewContnet(),
                  ListViewContnet(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListViewContnet extends StatelessWidget {
  //const ListViewContnet({Key key}) : super(key: key);

  final List<MeetingRoom> _allRooms = MeetingRoom.allRooms();
  final List<TimeInterval> _timeIntervals = TimeInterval.timeIntervallist();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    ));
  }

  //创建第一列行

  double numRowWidth = 100.0; //单个表宽
  double numRowHeight = 48.0; //表格高

  List<TableRow> _buildTableColumnOne() {
    List<TableRow> returnList = new List();
    returnList.add(_buildSingleColumnOne(-1));
    for (int i = 0; i < _timeIntervals.length; i++) {
      returnList.add(_buildSingleColumnOne(i));
    }
    return returnList;
  }

//创建tableRows
  List<TableRow> _buildTableRow() {
    List<TableRow> returnList = new List();
    returnList.add(_buildSingleRow(-1));
    for (int i = 0; i < _timeIntervals.length; i++) {
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
          _buildSideBox(
              index == -1 ? '时间段' : _timeIntervals[index].time, index == -1),
        ]);
  }

//创建一行tableRow
  TableRow _buildSingleRow(int index) {
    List<Widget> sideBoxList = new List();
    if (index == -1) {
      for (int i = 0; i < _allRooms.length; i++) {
        sideBoxList.add(_buildSideBox(_allRooms[i].name, true));
      }
      return TableRow(children: sideBoxList);
    } else {
      for (int i = 0; i < _allRooms.length; i++) {
        sideBoxList.add(_buildSingleButton());
      }
      return TableRow(children: sideBoxList);
    }
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

  //创建单个Button
  Widget _buildSingleButton() {
    return Padding(
      padding: EdgeInsets.only(left: 2.0),
      child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('点我'),
          onPressed: () {}),
    );
  }
}
