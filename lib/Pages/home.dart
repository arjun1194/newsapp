import 'package:flutter/material.dart';
import 'package:newsapp/Components/nav_buttons.dart';
import 'package:newsapp/Components/news_card.dart';
import 'package:newsapp/Models/article_model.dart';
import 'package:newsapp/Models/news_model.dart';
import 'package:newsapp/Repository/repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repository = Repository();
  Future currentNewsFuture;
  int currentPage = 0;
  int MaxPage = 10;

  @override
  void initState() {
    super.initState();
    setState(() {
      print(currentPage);

    });

  }

  decreasePageNumber() {
    setState(() {
      currentPage = (currentPage > 0) ? currentPage - 1 : currentPage;
      currentNewsFuture =
          repository.fetchNewsWithCurrentLocationWithPage(currentPage);
    });
  }

  increasePageNumber() {
    setState(() {
      currentPage = (currentPage < MaxPage) ? currentPage + 1 : currentPage;
      currentNewsFuture =
          repository.fetchNewsWithCurrentLocationWithPage(currentPage);
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
        future: currentNewsFuture,
        builder: (BuildContext context, AsyncSnapshot<News> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return (snapshot.hasError)
                  ? Text("error: ${snapshot.error}")
                  :   HomeBuilder(
                  leftButtonPressed: decreasePageNumber,
                  rightButtonPressed: increasePageNumber,
                  currentPage: currentPage,news:snapshot.data);
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
          }
          return Text("End");
        });
  }
}

class HomeBuilder extends StatefulWidget {
  VoidCallback leftButtonPressed;
  VoidCallback rightButtonPressed;
  int currentPage;
   News news;

  HomeBuilder(
      {this.leftButtonPressed, this.rightButtonPressed, this.currentPage,this.news});

  @override
  _HomeBuilderState createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView(children:homebuilder(widget.leftButtonPressed, widget.rightButtonPressed, widget.currentPage, widget.news));
  }
}



List<Widget> homebuilder(
    VoidCallback leftButtonPressed,VoidCallback rightButtonPressed, currentPage,News news){
  List<Widget> widgetList = [];

  widgetList.add(NavigationButtons(
    leftButtonPressed: leftButtonPressed,
    currentPage: currentPage,
    rightButtonPressed: rightButtonPressed,
  ));

  List<Articles> articleList = news.articles;
  articleList.forEach((article){widgetList.add(NewsCard(articles: article,));});

  widgetList.add(NavigationButtons(
    leftButtonPressed: leftButtonPressed,
    currentPage: currentPage,
    rightButtonPressed: rightButtonPressed,
  ));
  return widgetList;
}
