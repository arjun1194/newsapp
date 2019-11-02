
import 'package:newsapp/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Pages/browser_news.dart';
import 'package:newsapp/Pages/search.dart';

import '../main.dart';


Map<String, WidgetBuilder> routes = {
  '/' : (BuildContext context) => MyHome(),
  '/news' : (BuildContext context) => BrowserNews(),
  '/search':(BuildContext context) => Search(),
};