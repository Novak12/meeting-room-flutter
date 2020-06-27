import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:meetingroomflutter/widgets/DemoPage.dart';

import 'widgets/DomeStateWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: DemoPage(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
