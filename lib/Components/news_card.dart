import 'package:flutter/material.dart';
import 'package:newsapp/Models/article_model.dart';
import 'package:newsapp/Models/url.dart';
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  widget.articles.urlToImage ?? "",
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    child: Text(
                      widget.articles.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: cardHeading,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.articles.author ?? "",
                        style: cardSource,
                      ),
                      Text(
                        widget.articles.description ?? "",
                        style: cardBody,
                        maxLines: 3,
                      ),
                      Text(
                        widget.articles.publishedAt ?? "",
                        style: cardSource,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      FlatButton(
                        onPressed: () {
                          Url url = Url(url: widget.articles.url);
                          Navigator.pushNamed(context, '/news', arguments: url);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.event_note),
                            Text('View full coverage'),
                          ],
                        ),
                      ),
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
