import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:meetingroom/repository/shared_preferences.dart';
import 'package:meetingroom/util/constance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "new_page");
                },
                child: new Text("This is a new route page")),
            FlatButton(
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "test_route");
                },
                child: new Text("This is a new test route")),
          ],
        ),
      ),
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
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(40),
      //   child: Container(
      //     decoration: UnderlineTabIndicator(
      //       borderSide: BorderSide(color: Colors.white),
      //     ),
      //     height: 40,
      //     alignment: Alignment.center,
      //   ),
      // ),
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

  void _showDialog(BuildContext context) {
//    showSlideDialog(
//        backgroundColor: blueGrey_900,
//        context: context,
//        child: Container(
//          child: Column(
//            children: <Widget>[
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  IconButton(
//                    tooltip: "Capure Screen",
//                    icon: Icon(
//                      FontAwesomeIcons.camera,
//                      color: Colors.white,
//                    ),
//                    onPressed: () {
//                      screenshotController
//                          .capture(
//                          pixelRatio: 1.5,
//                          delay: Duration(milliseconds: 10))
//                          .then(
//                            (File image) async {
//                          await ShareExtend.share(image.path, "image",
//                              subject: "Total Cases");
//                        },
//                      );
//                    },
//                  ),
//                  IconButton(
//                    tooltip: "Share",
//                    icon: Icon(
//                      FontAwesomeIcons.share,
//                      color: Colors.white,
//                    ),
//                    onPressed: _shareGlobalInfo,
//                  )
//                ],
//              ),
//              Screenshot(
//                controller: screenshotController,
//                child: PieChartImpl(
//                  textColor: Colors.white,
//                  dataMap: _getPieChartData(),
//                ),
//              )
//            ],
//          ),
//        ),
//        barrierColor: Colors.white.withOpacity(0.7),
//        pillColor: Colors.white);
  }

  Map<String, double> _getPieChartData() {
    Map<String, double> dataMap = Map();
//    dataMap.putIfAbsent("Total Cases : ${CoronaBloc().globalInfoDto$.cases}",
//            () => CoronaBloc().globalInfoDto$.cases.toDouble());
//    dataMap.putIfAbsent(
//        "Total Recovered : ${CoronaBloc().globalInfoDto$.recovered}",
//            () => CoronaBloc().globalInfoDto$.recovered.toDouble());
//    dataMap.putIfAbsent("Total Deaths : ${CoronaBloc().globalInfoDto$.deaths}",
//            () => CoronaBloc().globalInfoDto$.deaths.toDouble());

    return dataMap;
  }

  void _shareGlobalInfo() {
//    var msg = CoronaBloc()
//        .globalInfoDto$
//        .toJson()
//        .toString()
//        .replaceAll("{", "")
//        .replaceAll("}", "");
//
//    msg = "Total Cases \n" + msg + '\n\n' + google_play_app_url;
//    Share.share(msg, subject: "Total Global Info");
  }
}
