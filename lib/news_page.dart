import 'package:timeago/timeago.dart' as timeago;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bitcoinbuy/NewsDetail.dart';
import 'package:bitcoinbuy/localization/app_localizations.dart';
import 'package:bitcoinbuy/models/NewsData.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsData newsData;
  List<Analysis> newsDataList = [];
  List<Analysis> newsAnalysis = [];
  List<Analysis> newsBlockchain = [];
  List<Analysis> newsExchanges = [];
  List<Analysis> newsGeneral = [];
  List<Analysis> newsGovernment = [];
  List<Analysis> newsIco = [];
  List<Analysis> newsMining = [];

  @override
  void initState() {
    callCryptocoinNewApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xff0f2f2f3),
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsAnalysis;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                  AssetImage("assets/newsheaderimages/1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 115),
                                  Container(
                                    width: 100,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        color: Colors.black26

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppLocalizations.of(context).translate('news_page_analysis_news'),textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                        maxLines: 1,

                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsBlockchain;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("assets/newsheaderimages/2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 115),
                                  Container(
                                    width: 120,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        color: Colors.black26
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppLocalizations.of(context).translate('news_page_blockchai_news'),textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),




                                ],
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsExchanges;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("assets/newsheaderimages/3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 115),
                                  Container(
                                    width: 120,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        color: Colors.black26

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppLocalizations.of(context).translate('news_page_exchange_news'),textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),




                                ],
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsGeneral;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage("assets/newsheaderimages/4.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[

                                SizedBox(height: 115),
                                Container(
                                  width: 120,
                                  decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      color: Colors.black26

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context).translate('news_page_general_news'),textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsGovernment;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage("assets/newsheaderimages/5.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[


                                SizedBox(height: 115),
                                Container(
                                  width: 120,
                                  decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      color: Colors.black26

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context).translate('news_page_government_news'),textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsIco;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage("assets/newsheaderimages/6.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[


                                SizedBox(height: 115),
                                Container(
                                  width: 120,
                                  decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      color: Colors.black26

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context).translate('news_page_ico_news'),textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            newsDataList = newsMining;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage("assets/newsheaderimages/7.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[


                                SizedBox(height: 115),
                                Container(
                                  width: 120,
                                  decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      color: Colors.black26

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppLocalizations.of(context).translate('news_page_mining_news') ,textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: _buildListView(newsDataList),
              ),
            ],
          ),
        ));
  }

  Future<void> callCryptocoinNewApi() async {
    var response = await http.get(
        'https://cryptocontrol.io/api/v1/public/news/coin/bitcoin/category?key=2c433b490b4dbe716eb46565572b8e6d');
    final data = json.decode(response.body) as Map;
    if (data != null) {
      setState(() {
        newsAnalysis = data['analysis']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsBlockchain = data['blockchain']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsExchanges = data['exchanges']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsGeneral = data['general']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsGovernment = data['government']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsIco = data['ico']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsMining = data['mining']
            .map<Analysis>((json) => Analysis.fromJson(json))
            .toList();
        newsDataList = newsAnalysis;
      });
    } else {}
  }

  _buildListView([List<Analysis> newsAnalysis]) {
    return Container(
      //padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 0),
      child: newsAnalysis.length <= 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: newsAnalysis.length,
          itemBuilder: (BuildContext context, int j) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewsDetail(newsAnalysis[j].originalImageUrl,
                              newsAnalysis[j].title,newsAnalysis[j].publishedAt,
                              newsAnalysis[j].description,
                              newsAnalysis[j].url
                          )
                  ),
                );
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  //height: 150,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: 165,
                          height: 90,
                          child: new Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(newsAnalysis[j].title,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              new Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                      width: 50.0,
                                      height: 25.0,
                                      child: new RaisedButton(
                                        child: new Text(
                                          'Hot',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        textColor: Color(0xffff8d64),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(10.0),
                                        ),
                                        color: Color(0xfffef1eb),
                                        onPressed: () {},
                                      )),
                                  Text(
                                      timeago.format(
                                          DateTime.tryParse(
                                              newsAnalysis[j].publishedAt),
                                          allowFromNow: true),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.orangeAccent[200],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(newsAnalysis[j].thumbnail??""),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}