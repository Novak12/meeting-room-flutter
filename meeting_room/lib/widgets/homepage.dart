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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        body: HomePageListView());
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
