import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:meetingroom/util/constance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      //drawer: DrawerWidget(),

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
