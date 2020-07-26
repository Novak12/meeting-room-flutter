import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetingroomflutter/models/meetingroom.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<MeetingRoom> _allRooms = MeetingRoom.allRooms();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
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
                  _allRooms[index].country,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  "Population: ${_allRooms[index].population}",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              _showSnackBar(context, _allRooms[index]);
            },
          )
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context, MeetingRoom item) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} is a city in ${item.country}"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
