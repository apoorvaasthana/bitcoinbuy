
import 'package:bitcoinbuy/localization/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetail extends StatelessWidget {
  final String imageUrl;
  final String newsText;
  final String title;
  final String publishedAt;
  final String sourceUrl;

  NewsDetail(this.imageUrl,this.title,this.publishedAt,this.newsText,this.sourceUrl);


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM yyyy | kk:mm:a').format(DateTime.tryParse(publishedAt));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('news_details')),
      ),
      body: SafeArea(
        child:
        WebView(
          initialUrl: sourceUrl,
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
          },
          // TODO(iskakaushik): Remove this when collection literals makes it to stable.
          // ignore: prefer_collection_literals
          javascriptChannels: <JavascriptChannel>[
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        ),

//        Stack(
//          children: <Widget>[
//            Container(
//              alignment: Alignment.topCenter,
//              child: Image.network(
//                imageUrl,
//                height: 250,
//                width: double.infinity,
//                fit: BoxFit.cover,
//              ),
//            ),
//            SizedBox(height: 245,),
//            Padding(
//              padding: const EdgeInsets.only(top:200.0,left: 20,right: 20),
//              child: Card(
//                elevation: 16,
//                child: Container(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Flexible(
//                                child: Text(
//                                  "",
//                                  maxLines: 1,
//                                  textAlign: TextAlign.justify,
//                                  style: TextStyle(color: Colors.black,
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 12.0),
//                                ),
//                              ),
//                              Flexible(
//                                child: Text(
//                                  formattedDate,
//                                  maxLines: 1,
//                                  textAlign: TextAlign.justify,
//                                  style: TextStyle(color: Colors.grey,
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 12.0),
//                                ),
//                              ),
//                            ],
//                          ),
//                          Flexible(
//                            child: Text(
//                              newsText,
//                              maxLines: 3,
//                              textAlign: TextAlign.justify,
//                              style: TextStyle(color: Colors.black,
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 16.0),
//                            ),
//                          ),
//                          SizedBox(height: 10,),
//                          Text(
//                            newsText,
//                            textAlign: TextAlign.justify,
//                            style: TextStyle(color: Colors.black,
//                                fontWeight: FontWeight.normal,
//                                fontSize: 15.0),
//                          ),
//                        ],
//                      )
//
//
//
//                    )),
//              ),
//            ),
//          ],
//
//
//),
      ),
    );
  }


}