
import 'package:newsapp/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Pages/news.dart';


Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Home(),
  '/news' : (BuildContext context) => Home(),
};