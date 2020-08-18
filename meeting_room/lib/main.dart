import 'package:flutter/material.dart';
import 'package:meetingroom/widgets/bookingpage.dart';
import 'package:meetingroom/widgets/bookingtabpage.dart';
import 'package:meetingroom/widgets/homepage.dart';
import 'package:meetingroom/widgets/login.dart';

void main() => runApp(MyApp());

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
        "home_page": (context) => HomePage(title: "flutter"),
        "booking_page": (context) => BookingPage(),
        "booking_tab_page": (context) => BookingTabPage(),
      },
    );
  }
}
