import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:meetingroom/repository/shared_preferences.dart';
import 'package:meetingroom/util/constance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meetingroom/widgets/homepage_listview.dart';

import 'drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: PreferredSize(
          child: _AppBarWidget(),
          preferredSize: Size.fromHeight(60),
        ),
        floatingActionButton: BoomMenu(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            scrollVisible: true,
            overlayColor: Colors.black,
            overlayOpacity: 0.7,
            foregroundColor: Colors.white,
            child: Icon(Icons.sort),
            children: [
              MenuItem(
                child: Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.white,
                ),
                title: "Sort by total cases",
                titleColor: Colors.white,
                subtitle: "",
                subTitleColor: Colors.white,
                backgroundColor: Colors.blue[600],
                onTap: () => sortBy(sortBy: cases),
              ),
            ]),
        body: new Scrollbar(
            child: new ListView.separated(
                itemBuilder: (context, item) {
                  return _myListWidget(context, titleItems[item],
                      iconItems[item], subTitleItems[item]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    new Divider(),
                itemCount: iconItems.length)));
  }

  List<String> titleItems = <String>[
    'Beijing',
    'Munich',
    'Shanghai',
    'Tokyo',
    'Chicago',
    'Now York',
    'Berlin',
    'London',
    'Paris',
    'Wuhan',
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
    'Changzhi 5F',
    'Changzhi 5F',
    'Changzhi 5F',
    'Changzhi 5F',
    'Changzhi 5F',
    'Changzhi 6F',
    'Changzhi 6F',
    'Changzhi 6F',
    'sChangzhi 6F',
    'Changzhi 6F',
    'Changzhi 6F',
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

  Future<void> sortBy({String sortBy}) async {
    //await CoronaBloc().getAllCountriesInfoSortedBy(sortBy: sortBy);
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
