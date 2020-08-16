import 'package:examples/drop_down_but.dart';
import 'package:examples/list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, disabledColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Examples'),
        ),
        body: Container(padding: EdgeInsets.all(20), child: DropDownBut()),
      ),
    );
  }
}
