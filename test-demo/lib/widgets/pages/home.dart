import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Beer List'),
    Text('Add new beer'),
    Text('Favourites'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test demo"),
      ),
      body: new Scrollbar(
          child: new ListView.separated(
              itemBuilder: (context, item) {
                return _myListWidget(context, titleItems[item], iconItems[item],
                    subTitleItems[item]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  new Divider(),
              itemCount: iconItems.length)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_drink), title: Text('Beers')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<String> titleItems = <String>[
    'ListView',
    'GraidView',
    'Test',
    'Test',
    'Test',
    'Test',
    'Test',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.print),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
  ];

  List<String> subTitleItems = <String>[
    'Demo',
    'Demo',
    'Demo',
    'Demo',
    'Demo',
    'Demo',
    'Demo',
  ];

  Widget _myListWidget(BuildContext context, String titleItem, Icon iconItem,
      String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (titleItem == "ListView") Navigator.pushNamed(context, titleItem);
      },
    );
  }
}
