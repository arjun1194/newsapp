import 'package:flutter/material.dart';
import 'package:newsapp/Components/news_card.dart';
import 'package:newsapp/Models/article_model.dart';
import 'package:newsapp/Models/news_model.dart';
import 'package:newsapp/Repository/repository.dart';
import 'package:paging/paging.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repository = Repository();
  int page;
  int pageSize=10;
  int totalElements;
  ScrollController scrollController;



  Future<List<Articles>> currentNewsFuture(int previousCount) async{

    News news = await  repository.fetchTopHeadlines(country: 'in',pageSize:pageSize,page: (previousCount/pageSize).round() );
    return news.articles;
  }
  @override
  void initState() {
    super.initState();
    pageSize = 10;
    page = 1;
    //check from api
    totalElements = 10;

  }
  @override
  Widget build(BuildContext context) {
    return Pagination<Articles>(
        pageBuilder: (int currentListSize) =>  currentNewsFuture(currentListSize),
        itemBuilder: (index, item) {
          return NewsCard(articles: item);
        });
  }


}


