import 'package:http/http.dart' as http;
import 'package:newsapp/Models/article_model.dart';
import 'package:newsapp/Models/news_model.dart';
import 'package:newsapp/app_settings.dart';
import 'dart:convert' as convert;

class Repository{

  //creating a singleton class
  static final Repository _singleton = Repository._internal();
  factory Repository() {
    return _singleton;
  }
  Repository._internal();


  //API CALLS
  Future<News> fetchNewsWithCurrentLocationWithPage(int page) async{
    //TODO:implement location with geo_location
    //query-params
    String country = "in";
    int pageSize = 5;
    String url = "$api_endpoint/top-headlines?country=$country&apiKey=$api_key&page=$page&pageSize=$pageSize" ;
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    News news = News.fromJson(jsonResponse);
    return news;
    }

  }


