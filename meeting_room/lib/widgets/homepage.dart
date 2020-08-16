import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetingroom/models/meetingroom.dart';
import 'drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MeetingRoom> _allRooms = MeetingRoom.allRooms();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        child: _AppBarWidget(),
        preferredSize: Size.fromHeight(60),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _getItemUI(context, index);
          },
          itemCount: _allRooms.length,
        ),
      ),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              _allRooms[index].image,
              //fit: BoxFit.cover,
              width: 100.0,
              height: 140.0,
            ),
            title: Text(
              _allRooms[index].name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _allRooms[index].location,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "预订情况: ${_allRooms[index].status}",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("booking_page", arguments: "Booking Details");
            },
          )
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context, MeetingRoom item) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} is a city in ${item.location}"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  //final ScreenshotController screenshotController = ScreenshotController();

  _AppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 15,
      centerTitle: true,
      title: InkWell(
        child: StreamBuilder(
          builder: (context, snapshot) {
            return RichText(
              text: TextSpan(
                  text: "Meeting Room", style: TextStyle(fontSize: 30)),
            );
          },
        ),
        onTap: _launchURL,
      ),
    );
  }

  Future<void> _launchURL() async {
//    if (await canLaunch(corona_main_site)) {
//      await launch(corona_main_site, enableJavaScript: true);
//    }
  }

  void _showDialog(BuildContext context) {}

  Map<String, double> _getPieChartData() {
    Map<String, double> dataMap = Map();

    return dataMap;
  }

  void _shareGlobalInfo() {}
}
