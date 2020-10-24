
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bitcoinbuy/localization/app_localizations.dart';
import 'package:bitcoinbuy/models/Bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrendPage extends StatefulWidget  {
  const TrendPage({Key key}) : super(key: key);


  @override
  _TrendPageState createState() => _TrendPageState();
}
class _TrendPageState extends State<TrendPage>{
  int buttonType = 5;
  String name = "";
  double coin = 0;
  String result = '';
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  String currencyNameForImage;
  String _type="Year";
  List<LinearSales> currencyData = [];
  List<Bitcoin> bitcoinList = [];
  double diffRate =0;
  @override
  void initState() {
    callBitcoinApi();
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
          child:Column(children: <Widget>[
            Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10,),

                      Row(
                        children: <Widget>[
                          Icon( Icons.attach_money, size: 28,color: Colors.white),
                          Text('${coin}', style: TextStyle(fontSize: 28, color: Colors.white)),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(diffRate < 0? '-': "+" ,style: TextStyle(fontSize: 14, color: diffRate < 0? Colors.red: Colors.green) ),
                          Icon( Icons.attach_money, size: 14, color: diffRate < 0? Colors.red: Colors.green),
                          Text('${result}' ,style: TextStyle(fontSize: 14, color:  diffRate < 0? Colors.red: Colors.green) ),


                        ],
                      ),
                    ],
                  )

                ],
              ),

            ),
            SizedBox(height: 10,),
            Expanded(
              child:Container (
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 0),
                child: ListView(
                  children: <Widget>[

                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        //height: 150,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[

                              new Row(

                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 10,),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: currencyNameForImage!=null?FadeInImage.assetNetwork(
                                                placeholder: 'assets/images/cob.png',
                                                image:"http://45.34.15.25:8080/Bitcoin/resources/icons/${currencyNameForImage.toLowerCase()}.png")
                                                :Image.asset("assets/images/cob.png"),
                                          )



//                                  Image.asset('assets/images/Bitcoin.png'),

                                      ),

                                    ],
                                  ),
                                  new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      SizedBox(height: 10,),
                                      Text('${name}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.start, ),

                                      Text('${coin} ${AppLocalizations.of(context).translate('trends_page_coin')}' ,style: TextStyle(fontSize: 10),textAlign: TextAlign.left, ),
                                    ],
                                  ),

                                  /*   new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 50),
                                    Icon( Icons.attach_money, size: 14,),
                                    Text('1,872.22', style: TextStyle(fontSize: 14), textAlign: TextAlign.left,),

                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 50),
                                    Text('-' ,style: TextStyle(fontSize: 10, color: Colors.red) ),
                                    Icon( Icons.attach_money, size: 10, color: Colors.red),
                                    Text('1,200.31 (32.05%)' ,style: TextStyle(fontSize: 10, color: Colors.red) ),

                                  ],
                                ),
                              ],
                            ), */

                                ],

                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Row(children: <Widget>[
                                  Center(
                                    child:Container(
                                      width: MediaQuery.of(context).size.width/1.16,
                                      height: MediaQuery.of(context).size.height/2,
                                      child: new charts.LineChart(_createSampleData(),
                                        defaultRenderer:
                                        new charts.LineRendererConfig(includeArea: true, stacked: true),
                                        animate: true,behaviors: [

                                          new charts.RangeAnnotation([
                                            new charts.RangeAnnotationSegment(
                                              0, bitcoinList.length-1, charts.RangeAnnotationAxisType.domain,
                                            ),
                                            new charts.RangeAnnotationSegment(
                                                0, bitcoinList.length-1, charts.RangeAnnotationAxisType.domain)

//
//                                    new charts.RangeAnnotationSegment(
//                                        15, 20, charts.RangeAnnotationAxisType.measure,
//                                        startLabel: 'Measure 1 Start',
//                                        endLabel: 'Measure 1 End',
//                                        color: charts.MaterialPalette.gray.shade300),
//                                    new charts.RangeAnnotationSegment(
//                                        35, 65, charts.RangeAnnotationAxisType.measure,
//                                        startLabel: 'Measure 2 Start',
//                                        endLabel: 'Measure 2 End',
//                                        color: charts.MaterialPalette.gray.shade400),
                                          ]),
                                        ],

                                      ),
                                    ),
                                  ),
                                ],),
                              ),
                              SizedBox(height: 10,),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  /* ButtonTheme(
                                  minWidth: 50.0,
                                  height: 25.0,
                                  child: new RaisedButton(
                                    child: new Text('HOUR', style: TextStyle(fontSize: 9),),
                                    textColor: buttonType==1 ? Colors.white :Colors.black,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    color: buttonType==1 ? Colors.black : Colors.white,
                                    onPressed: () => setState(() => buttonType = 1),
                                  ),),
                                ButtonTheme(
                                  minWidth: 50.0,
                                  height: 25.0,
                                  child: new RaisedButton(
                                    child: new Text('DAY', style: TextStyle(fontSize: 9),),
                                    textColor: buttonType==2 ? Colors.white :Colors.black,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    color: buttonType==2 ? Colors.black : Colors.white,
                                    onPressed: () => setState(() => buttonType = 2),
                                  ),), */
                                  ButtonTheme(
                                    minWidth: 50.0,
                                    height: 25.0,
                                    child: new RaisedButton(
                                      child: new Text(AppLocalizations.of(context).translate('trends_page_week'), style: TextStyle(fontSize: 9),),
                                      textColor: buttonType==3 ? Colors.white :Colors.black,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      color: buttonType==3 ? Colors.black : Colors.white,
                                      onPressed: (){ setState(() { buttonType = 3; _type = "Week";  callBitcoinApi();} );},
                                    ),),
                                  ButtonTheme(
                                    minWidth: 50.0,
                                    height: 25.0,
                                    child: new RaisedButton(
                                      child: new Text('MONTH', style: TextStyle(fontSize: 9),),
                                      textColor: buttonType==4 ? Colors.white :Colors.black,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      color: buttonType==4 ? Colors.black : Colors.white,
                                      onPressed: (){ setState(() { buttonType = 4; _type = "Month"; callBitcoinApi(); } );},
                                    ),),
                                  ButtonTheme(
                                    minWidth: 50.0,
                                    height: 25.0,
                                    child: new RaisedButton(
                                      child: new Text('YEAR', style: TextStyle(fontSize: 9),),
                                      textColor: buttonType==5 ? Colors.white :Colors.black,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      color: buttonType==5 ? Colors.black : Colors.white,
                                      onPressed: () { setState(() { buttonType = 5; _type = "Year";  callBitcoinApi();} );},
                                    ),),


                                ],
                              ),
                              SizedBox(height: 10,),
                            ],
                          )
                      ),

                    ),



                  ],
                ),),),
          ],),)

    );


  }



  List<charts.Series<LinearSales, double>> _createSampleData() {


    return [
      new charts.Series<LinearSales, double>(
        id: 'Tablet',
        // colorFn specifies that the line will be red.
        colorFn: (_, __) => diffRate < 0? charts.MaterialPalette.red.shadeDefault: charts.MaterialPalette.green.shadeDefault,
        // areaColorFn specifies that the area skirt will be light red.
        // areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.date,
        measureFn: (LinearSales sales, _) => sales.rate,
        labelAccessorFn: (LinearSales sales, _) => sales.date.toDouble().toString(),
        data: currencyData,

      ),
    ];
  }

  Future<void> callBitcoinApi() async {
    final SharedPreferences prefs = await _sprefs;
    var currencyName = prefs.getString("currencyName") ?? 'BTC';
    currencyNameForImage = currencyName;
    var uri = 'http://45.34.15.25:8080/Bitcoin/resources/getBitcoinGraph?type=${_type}&name=${currencyName}';

    print(uri);
    var response = await get(Uri.parse(uri));
    //  print(response.body);
    final data = json.decode(response.body) as Map;
    //print(data);
    if(data['error'] == false){
      setState(() {
        bitcoinList = data['data'].map<Bitcoin>((json) =>
            Bitcoin.fromJson(json)).toList();
        double count = 0;
        diffRate = double.parse(data['diffRate']);
        if(diffRate < 0)
          result = data['diffRate'].replaceAll("-", "");
        else
          result = data['diffRate'];

        currencyData = [];
        bitcoinList.forEach((element) {
          currencyData.add(new LinearSales(count, element.rate));
          name = element.name;
//         coin = element.rate;

          String step2 = element.rate.toStringAsFixed(2);

          print(step2);
          double step3 = double.parse(step2);
          coin = step3;
          count = count+1;
        });
        //  print(currencyData.length);
      });

    }
    else {
      //  _ackAlert(context);

    }

  }
}
class LinearSales {
  final double date;
  final double rate;

  LinearSales(this.date, this.rate);
}