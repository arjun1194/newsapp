import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyHome(),
    ));

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('News App')
      ),
      body:Center(child: Text('hello'),),
    );
  }
}
