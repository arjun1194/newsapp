import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/Models/url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserNews extends StatefulWidget {
  @override
  _BrowserNewsState createState() => _BrowserNewsState();
}

class _BrowserNewsState extends State<BrowserNews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    Url args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('${args.url}'),
        ),
        body: WebView(onPageFinished: (msg){print('done');},
          initialUrl: args.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
