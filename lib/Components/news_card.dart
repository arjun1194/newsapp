import 'package:flutter/material.dart';
import 'package:newsapp/Models/article_model.dart';

import '../app_settings.dart';


class NewsCard extends StatefulWidget {
  final Articles articles;

  NewsCard({Key key, this.articles}) : super(key: key);
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey,),color: Colors.black ),
        child: Stack(
          children: <Widget>[
            Image.network(widget.articles.urlToImage??""),
            Column(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(widget.articles.title??"",
                  overflow: TextOverflow.ellipsis,
                  style: cardHeading,
                ),
                Container(color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.articles.author??"",style: cardSource,),
                      Text(widget.articles.description??"",style: cardBody,maxLines: 3,),
                      Text(widget.articles.publishedAt??"",style: cardSource,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
