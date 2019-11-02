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
  Future<News> fetchTopHeadlines({int page,String country,int pageSize}) async{
    //TODO:implement location with geo_location
    //query-params
    String country_param = (country!=null)?'&country=$country':'';
    String page_param = (page!=null)?'&page=$page':'';
    String pageSize_param = (pageSize!=null)?'&pageSize=$pageSize':'';
    //server-url
    String url = '$api_endpoint/top-headlines?'+ 'apiKey=$api_key'+country_param+page_param+pageSize_param;
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    News news = News.fromJson(jsonResponse);
    return news;
    }

  Future<News> fetchEverything({String q,String qInTitle,String sources,int page,int pageSize}) async{
//    //TODO:implement location with geo_location
//    //query-params
//    String country_param = (country!=null)?'&country=$country':'';
//    String page_param = (page!=null)?'&page=$page':'';
//    String pageSize_param = (pageSize!=null)?'&pageSize=$pageSize':'';
//    //server-url
//    String url = '$api_endpoint/top-headlines?'+ 'apiKey=$api_key'+country_param+page_param+pageSize_param;
//    var response = await http.get(url);
//    var jsonResponse = convert.jsonDecode(response.body);
//    News news = News.fromJson(jsonResponse);
    return news;
  }




  }


