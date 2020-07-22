import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:meetingroom/repository/shared_preferences.dart';
import 'package:meetingroom/util/constance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        preferredSize: Size.fromHeight(130),
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
      elevation: 5,
      centerTitle: true,
      actions: <Widget>[
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            bool showFavorite = CoronaSharedPreferences().showFavorite;
            return IconButton(
              tooltip: "Show Favorite",
              iconSize: 20,
              icon: Icon(
                  showFavorite
                      ? FontAwesomeIcons.solidStar
                      : FontAwesomeIcons.star,
                  color: showFavorite ? Colors.yellowAccent : Colors.white),
              onPressed: () {
                CoronaSharedPreferences().saveShowFavorite(!showFavorite);
                setState(
                  () {
//                    FAVORITE_EVENT favoriteEvent = showFavorite
//                        ? FAVORITE_EVENT.NO_FAVORITE
//                        : FAVORITE_EVENT.SHOW_FAVORITE;
//                    CoronaBloc()
//                        .favoriteEventBehaviorSubject$
//                        .add(favoriteEvent);
                  },
                );
              },
            );
          },
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            bool darkThemeOn = CoronaSharedPreferences().darkThemeOn;
            return IconButton(
              tooltip: "Dark/Light Mode",
              iconSize: 20,
              icon: Icon(
                  darkThemeOn
                      ? FontAwesomeIcons.solidMoon
                      : FontAwesomeIcons.moon,
                  color: darkThemeOn ? Colors.yellowAccent : Colors.white),
//                onPressed: () {
//                  CoronaSharedPreferences().saveDarkTheme(!darkThemeOn);
//                  final ThemeProvider themeProvider =
//                  Provider.of<ThemeProvider>(context, listen: false);
//                  themeProvider.setThemeData = darkThemeOn;
//                  setState(() {});
//                }
            );
          },
        ),
        IconButton(
          tooltip: "Search",
          iconSize: 20,
          icon: Icon(FontAwesomeIcons.search),
//          onPressed: () {
//            showSearch<dynamic>(
//              context: context,
//              delegate: CustomSearchDelegate(),
//            );
//          },
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.white),
          ),
          height: 70,
          alignment: Alignment.center,
//          child: StreamBuilder<GlobalInfoDto>(
//            stream: CoronaBloc().globalInfoDtoBehaviorSubject$.stream,
//            builder: (context, snapshot) {
//              GlobalInfoDto globalInfoDto = CoronaBloc().globalInfoDto$;
//              if (snapshot.hasData || globalInfoDto != null) {
//                globalInfoDto = snapshot.data ?? globalInfoDto;
//                return GestureDetector(
//                  child: RichText(
//                    text: TextSpan(
//                      text: 'Total Cases: ',
//                      style: GoogleFonts.varelaRound(
//                          fontWeight: FontWeight.bold, fontSize: 16),
//                      children: <TextSpan>[
//                        TextSpan(
//                          text: '${globalInfoDto.cases}',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            backgroundColor: Colors.blue[600],
//                          ),
//                        ),
//                        TextSpan(text: '\nTotal Deaths: '),
//                        TextSpan(
//                          text: '${globalInfoDto.deaths}',
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              backgroundColor: Colors.red[600]),
//                        ),
//                        TextSpan(text: '\nTotal Recovered: '),
//                        TextSpan(
//                          text: '${globalInfoDto.recovered}',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            backgroundColor: Colors.green[600],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  onTap: () {
//                    _showDialog(context);
//                  },
//                );
//              } else {
//                return Text('');
//              }
//            },
//          ),
        ),
      ),
      title: InkWell(
//        child: StreamBuilder<GlobalInfoDto>(
//          stream: CoronaBloc().globalInfoDtoBehaviorSubject$.stream,
//          builder: (context, snapshot) {
//            GlobalInfoDto globalInfoDto = CoronaBloc().globalInfoDto$;
//            if (snapshot.hasData) {
//              globalInfoDto = snapshot.data;
//            }
//            String dateText = "";
//            if (globalInfoDto != null && globalInfoDto.updatedDate != null) {
//              dateText =
//                  globalInfoDto.updatedDate + " " + globalInfoDto.updatedTime;
//            }
//            return RichText(
//              text: TextSpan(
//                text: 'Global Cases  ',
//                style: GoogleFonts.concertOne(
//                    fontWeight: FontWeight.bold, fontSize: 25),
//                children: <TextSpan>[
//                  if (dateText != "") ...{
//                    TextSpan(
//                      text: '\n$dateText',
//                      style: TextStyle(fontSize: 15),
//                    )
//                  }
//                ],
//              ),
//            );
//          },
//        ),
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
