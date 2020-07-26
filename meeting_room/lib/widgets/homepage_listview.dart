import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageListView extends StatefulWidget {
  @override
  createState() => new HomePageListViewState();
}

class HomePageListViewState extends State<HomePageListView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(_myListWidget(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    return new Scaffold(
      body: new Scrollbar(
        child: new ListView.separated(
            itemBuilder: (context, item) {
              return _myListWidget(context, titleItems[item], iconItems[item],
                  subTitleItems[item]);
            },
            separatorBuilder: (BuildContext context, int index) => new Divider(
                  height: .5,
                  indent: 75,
                  color: Color(0xFFDDDDDD),
                ),
            itemCount: iconItems.length),
      ),
    );
  }
}

List<String> titleItems = <String>[
  'keyboard',
  'print',
  'router',
  'pages',
  'zoom_out_map',
  'zoom_out',
  'youtube_searched_for',
  'wifi_tethering',
  'wifi_lock',
  'widgets',
  'weekend',
  'web',
  '图accessible',
  'ac_unit',
];

List<Icon> iconItems = <Icon>[
  new Icon(Icons.keyboard),
  new Icon(Icons.print),
  new Icon(Icons.router),
  new Icon(Icons.pages),
  new Icon(Icons.zoom_out_map),
  new Icon(Icons.zoom_out),
  new Icon(Icons.youtube_searched_for),
  new Icon(Icons.wifi_tethering),
  new Icon(Icons.wifi_lock),
  new Icon(Icons.widgets),
  new Icon(Icons.weekend),
  new Icon(Icons.web),
  new Icon(Icons.accessible),
  new Icon(Icons.ac_unit),
];

List<String> subTitleItems = <String>[
  'subTitle: keyboard',
  'subTitle: print',
  'subTitle: router',
  'subTitle: pages',
  'subTitle: zoom_out_map',
  'subTitle: zoom_out',
  'subTitle: youtube_searched_for',
  'subTitle: wifi_tethering',
  'subTitle: wifi_lock',
  'subTitle: widgets',
  'subTitle: weekend',
  'subTitle: web',
  'subTitle: accessible',
  'subTitle: ac_unit',
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              'ListViewAlert',
              style: new TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
            content: new Text('您选择的item内容为:$titleItem'),
          );
        },
      );
    },
  );
}
