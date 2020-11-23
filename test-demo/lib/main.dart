import 'package:flutter/material.dart';
import 'package:meetingroomflutter/widgets/pages/cardview.dart';
import 'package:meetingroomflutter/widgets/pages/home.dart';
import 'package:meetingroomflutter/widgets/pages/listview.dart';
import 'package:meetingroomflutter/widgets/pages/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //用注册表来注册路由
      routes: {
        "/": (context) => Login(),
        "home_page": (context) => HomePage(title: "flutter Demo List"),
        "ListView": (context) => ListViewPage(),
        "CardView": (context) => CardPage(),
      },
    );
  }
}
