import 'package:flutter/material.dart';
import 'package:newsapp/Pages/home.dart';
import 'package:newsapp/routes/routes.dart';

import 'Components/app_bar.dart';

void main() => runApp(MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Application 1',
routes: routes,),);

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:Center(child: Home(),),
    );
  }
}
