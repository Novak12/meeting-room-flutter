import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _cardPageState createState() => _cardPageState();
}

class _cardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("card view"),
        ),
        body: new Container(
          width: 500,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text('Heart Shaker',
                      style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('TWICE', style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
