import 'dart:async';
import 'localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ScrollController _controllerList;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  final Completer<WebViewController> _controllerForm =
  Completer<WebViewController>();


  @override
  void initState() {
    _controllerList = ScrollController();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toaster',
          onMessageReceived: (JavascriptMessage message) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          });
    }

    return Scaffold(
        body: ListView (
            controller: _controllerList,
          children:[
             SizedBox(height: 5
               ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox(width: 10,),
            Container(
                child :  Image.asset(
                  'assets/images/BUYBITCOINLOGO.png',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .05,
                  width : 100
                ))]),
            SizedBox(height: 5,),
            Stack(
              children:[
            Container(
             child :  Image.asset(
               'assets/images/background_1.jpg',
               fit: BoxFit.fill,
               height: MediaQuery.of(context).size.height * .82,
             )),
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text(AppLocalizations.of(context).translate('bit_buy_1'),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,color: Colors.white),) ,
                  SizedBox(height: 30
                    ,),
                  Container(
                  padding: EdgeInsets.only(left:20, right:20),
                    child: Text(AppLocalizations.of(context).translate('bit_buy_2'),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w200,color: Colors.white),),
                  ), SizedBox(height: 30
                    ,),
                  Container(
                    /*   decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("assets/images/banner-form-bg.jpg"),
                           fit: BoxFit.cover,
                         ),
                       ), */
                    padding: EdgeInsets.only(left:20, right:20),
                    height: 480,
                    // color: Colors.white,
                    child: WebView(
                      initialUrl: 'https://finalresult.online/box_523100ebb96e564970bbae8833964652',
                      gestureRecognizers: Set()
                        ..add(Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer())),
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controllerForm.complete(webViewController);
                      },
                      // TODO(iskakaushik): Remove this when collection literals makes it to stable.
                      // ignore: prefer_collection_literals
                      javascriptChannels: <JavascriptChannel>[
                        _toasterJavascriptChannel(context),
                      ].toSet(),

                      onPageStarted: (String url) {
                        print('Page started loading: $url');
                      },
                      onPageFinished: (String url) {
                        print('Page finished loading: $url');
                      },
                      gestureNavigationEnabled: true,
                    ),
                  ),
                ],
              )
              ]
            ),
            SizedBox(height: 35,
              child: Container(
                color: Colors.white,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Text(AppLocalizations.of(context).translate('bit_buy_3'),style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.w100),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 35,
            child: Container(
              color: Colors.white,
            ),
            ),
           Padding(padding: EdgeInsets.only(left: 10,right: 10),
             child :  Container(

              height: MediaQuery.of(context).size.height*1.62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF132A3E)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),

                      Image.asset('assets/images/BTC.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text('BTC-Bitcoin',style: TextStyle(color: Colors.white,fontSize: 15),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Image.asset('assets/images/Graph_1.png',
                        height: MediaQuery.of(context).size.height*.2,
                        width: MediaQuery.of(context).size.width*.914,

                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child :Text(AppLocalizations.of(context).translate('bit_buy_4'),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 15),),

                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text('Source: Coin Market Cap',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),
                    SizedBox(height: 15,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 40,
                      child: RaisedButton(
                          child: new Text(AppLocalizations.of(context).translate('bit_buy_7'),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white)),
                          color:  Colors.green,
                          onPressed: () {
                            _controllerList.animateTo(_controllerList.offset - 4150,
                                curve: Curves.linear, duration: Duration(milliseconds: 500));


                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(10.0)))),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(AppLocalizations.of(context).translate('bit_buy_5'),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),

                      Image.asset('assets/images/Ethernum.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text('ETHEREUM - Ethereum',style: TextStyle(color: Colors.white,fontSize: 15),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Image.asset('assets/images/Graph_2.png',
                        height: MediaQuery.of(context).size.height*.2,
                        width: MediaQuery.of(context).size.width*.914,

                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child :Text(AppLocalizations.of(context).translate('bit_buy_6'),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 15),),

                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text('Source: Coin Market Cap',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 40,
                      child: RaisedButton(
                          child: new Text(AppLocalizations.of(context).translate('bit_buy_7'),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white)),
                          color:  Colors.green,
                          onPressed: () {

                            _controllerList.animateTo(_controllerList.offset - 4150,
                                curve: Curves.linear, duration: Duration(milliseconds: 500));

                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(10.0)))),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(AppLocalizations.of(context).translate('bit_buy_5'),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),

                      Image.asset('assets/images/BCH.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text('BCH-Bitcoin',style: TextStyle(color: Colors.white,fontSize: 15),)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Image.asset('assets/images/Graph_3.png',
                        height: MediaQuery.of(context).size.height*.2,
                        width: MediaQuery.of(context).size.width*.914,

                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child :Text(AppLocalizations.of(context).translate('bit_buy_6'),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 15),),

                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text('Source: Coin Market Cap',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 40,
                      child: RaisedButton(
                          child: new Text(AppLocalizations.of(context).translate('bit_buy_7'),
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white)),
                          color:  Colors.green,
                          onPressed: () {

                            _controllerList.animateTo(_controllerList.offset - 4150,
                                curve: Curves.linear, duration: Duration(milliseconds: 500));

                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(10.0)))),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(AppLocalizations.of(context).translate('bit_buy_5'),style: TextStyle(fontSize: 10,fontWeight: FontWeight.w100,color: Colors.white),)
                    ],
                  ),


                ],
              )
            )),
            Container(
              color : Colors.white,
              child: SizedBox(height: 8,),
            ),
            Container(
              height: MediaQuery.of(context).size.height*1.2,
                color: Color(0xFF174684),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  Container(
                    padding: EdgeInsets.only(left: 25,right: 25),
                    child: Text(AppLocalizations.of(context).translate('bit_buy_8'),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 25),),
                  ),
                  SizedBox(height: 25,),
                  Image.asset('assets/images/WhyInv_1.png',
                  height: 100,
                    width: 100,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text(AppLocalizations.of(context).translate('bit_buy_9'),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 25,),
                  Image.asset('assets/images/WhyInv_2.png',
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text(AppLocalizations.of(context).translate('bit_buy_10'),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 25,),
                  Image.asset('assets/images/WhyInv_3.png',
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Text(AppLocalizations.of(context).translate('bit_buy_11'),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 20),),
                  ),
                  SizedBox(height: 25,),
                  Text('Source : forbes.com',style: TextStyle(fontWeight: FontWeight.w100,fontSize: 15,color: Colors.white),)
                ],
              ),
            ),
              Container(
                color: Colors.white,
                child : SizedBox(height: 25,)
              ),
            Container(
              padding: EdgeInsets.only(left: 35,right: 35),
                color: Colors.white,
                child : Text(AppLocalizations.of(context).translate('bit_buy_12'),style: TextStyle(fontWeight: FontWeight.w100,color: Colors.black,fontSize: 25),textAlign: TextAlign.center,)
            ),
            Container(
                color: Colors.white,
                child : SizedBox(height: 25,)
            ),
            Container(
              height: 120,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Dash.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Dash',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/BinanceCoin.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Binance Coin',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/BitCoinGold.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Bitcoin Gold',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Cardano.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Cardano',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Eos.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Eos',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Ethernumclassic.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Ethernum classic',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Litercoin.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Litercoin',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Neo.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Neo',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Ripple.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Ripple',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Image.asset(
                            'assets/images/Zcash.png',

                            width: MediaQuery.of(context).size.width*.3,height: 80,
                            fit: BoxFit.fill,
                          ),
                          //  SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Z cash',
                                    //  'The finger and straighter your hair is the Faster the oil wicks down',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left:20, right:20),
              child: SizedBox(
                  width: 200,
                  height: 40,
                  child: RaisedButton(
                      child: new Text(AppLocalizations.of(context).translate('bit_buy_7'),
                          style: TextStyle(
                              fontSize: 13, color: Colors.white)),
                      color:  Colors.green,
                      onPressed: () {

                        _controllerList.animateTo(_controllerList.offset - 4150,
                            curve: Curves.linear, duration: Duration(milliseconds: 500));

                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(10.0)))),
            ),

            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left:20, right:20),
              child: Text(AppLocalizations.of(context).translate('bit_buy_13'),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.black26),textAlign: TextAlign.center,),
            ), SizedBox(height: 30
              ,),
          ]
        )
    );

  }
}