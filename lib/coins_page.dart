import 'dart:convert';
import 'package:bitcoinbuy/models/Bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'localization/app_localizations.dart';

class CoinsPage extends StatefulWidget  {
  const CoinsPage({Key key}) : super(key: key);


  @override
  _CoinsPageState createState() => _CoinsPageState();
}
class _CoinsPageState extends State<CoinsPage>{
  bool isLoading = false;
  List<Bitcoin> bitcoinList = [];
  SharedPreferences sharedPreferences;
  int _size = 0;
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
                  SizedBox(height: 10,),

                  Card(
                    elevation: 1,
                    color: Color(0xFF7208a),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF7208a), width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: new Container(
                      height: 50,
                      width: 280,

                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            autofocus: false,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).translate('search'),
                              labelStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                              fillColor: Colors.white,
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFF7208a),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Color(0xFF7208a),
                                ),
                              ),
                              suffixIcon: Container(
                                child: new IconButton(
                                  icon: new Icon(Icons.search,
                                    color: Colors.white, size: 28,),
                                  onPressed: null,
                                ),
                              ),
                            )),
                        suggestionsCallback: (pattern) async {
                          return await null; //_buildListView(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            leading: Icon(Icons.search),
                            title: Text(suggestion.name),
                            // subtitle: Text('\$${suggestion['price']}'),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          // getSalonList(suggestion.name);
                        },
                      ),
                    ),
                  ),
                  /*    Row(
                            children: <Widget>[
                              Icon( Icons.attach_money, size: 28,color: Colors.white),
                              Text('12,872.22', style: TextStyle(fontSize: 28, color: Colors.white)),

                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('-' ,style: TextStyle(fontSize: 14, color: Colors.green) ),
                              Icon( Icons.attach_money, size: 14, color: Colors.green),
                              Text('1,200.31 (32.05%)' ,style: TextStyle(fontSize: 14, color: Colors.green) ),


                            ],
                          ), */


                ],
              ),

            ),

            SizedBox(height: 15,),
            Expanded(
              child:
              Container (
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 0),

                child:LazyLoadScrollView(
                  isLoading: isLoading,
                  onEndOfPage: () => callBitcoinApi(),
                  child: bitcoinList.length<=0?
                  Center(child: CircularProgressIndicator())
                      :
                  ListView.builder(
                      itemCount: bitcoinList.length,
                      itemBuilder: (BuildContext context, int i) {

                        return InkWell (
                          child:Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:5.0,right:5.0),
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.all(8),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //   Image.asset('assets/images/bit'),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            height: 40,
//                        width: MediaQuery.of(context).size.width/9,
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: FadeInImage(
                                                placeholder: AssetImage('assets/images/cob.png'),
                                                image:NetworkImage("http://45.34.15.25:8080/Bitcoin/resources/icons/${bitcoinList[i].name.toLowerCase()}.png"),

                                              ),
                                            )


//                                        Image.network(
//                                            "http://45.34.15.25:8080/Bitcoin/resources/icons/${bitcoinList[i].name.toLowerCase()}.png"),
//                                      ),

                                        ),
                                        SizedBox(width: 5,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('${bitcoinList[i].name}', style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,),
//                                          Text('${double.parse(bitcoinList[i].rate.toString()).toStringAsFixed(2)} coin',
//                                              style: TextStyle(fontSize: 10)),
                                          ],
                                        ),

                                      ],
                                    ),

                                    Expanded(
                                      child: Container(
//                  width: MediaQuery.of(context).size.width/2.2,
                                        child: new charts.LineChart(
                                          _createSampleData(bitcoinList[i].historyRate, double.parse(bitcoinList[i].diffRate)),
                                          layoutConfig:new charts.LayoutConfig(
                                              leftMarginSpec: new charts.MarginSpec.fixedPixel(5),
                                              topMarginSpec: new charts.MarginSpec.fixedPixel(20),
                                              rightMarginSpec: new charts.MarginSpec.fixedPixel(5),
                                              bottomMarginSpec: new charts.MarginSpec.fixedPixel(20)),
                                          defaultRenderer:
                                          new charts.LineRendererConfig(
                                            includeArea: true, stacked: true,),
                                          animate: false,
                                          domainAxis: charts.NumericAxisSpec(
                                              showAxisLine: false,
                                              renderSpec: charts.NoneRenderSpec()),
                                          // hide y axis
                                          primaryMeasureAxis:
                                          charts.NumericAxisSpec(
                                              renderSpec: charts.NoneRenderSpec()),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 20,),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.attach_money, size: 10,),
                                                Text('${double.parse(bitcoinList[i].rate.toStringAsFixed(2))}',
                                                    style: TextStyle(fontSize: 10)),

                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(double.parse(bitcoinList[i].diffRate) < 0? '-': '+', style: TextStyle(
                                                    fontSize: 12, color: double.parse(bitcoinList[i].diffRate) < 0? Colors.red: Colors.green)),
                                                Icon(Icons.attach_money, size: 12,
                                                    color: double.parse(bitcoinList[i].diffRate) < 0? Colors.red: Colors.green),
                                                Text(double.parse(bitcoinList[i].diffRate) < 0?  double.parse(bitcoinList[i].diffRate.replaceAll('-', "")).toStringAsFixed(2): double.parse(bitcoinList[i].diffRate).toStringAsFixed(2) ,
                                                    style: TextStyle(fontSize: 12,
                                                        color: double.parse(bitcoinList[i].diffRate) < 0? Colors.red: Colors.green)),

                                              ],
                                            ),
                                          ],
                                        )
                                      ],

                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ),
                          onTap: (){callCurrencyDetails(bitcoinList[i].name);},
                        );

                      }
                  ),),),),
          ],),)

    );
  }



  List<charts.Series<LinearSales, int>> _createSampleData(historyRate, diffRate) {
    List<LinearSales> listData = [
    ];
    for(int i = 0; i< historyRate.length; i++) {
      double rate = historyRate[i]['rate'];
      listData.add( new LinearSales(i, rate));
    }

    return [
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        // colorFn specifies that the line will be red.
        colorFn: (_, __) => diffRate < 0? charts.MaterialPalette.red.shadeDefault: charts.MaterialPalette.green.shadeDefault,
        // areaColorFn specifies that the area skirt will be light red.
        // areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.count,
        measureFn: (LinearSales sales, _) => sales.rate,
        data: listData,
      ),
    ];
  }

  Future<void> callBitcoinApi() async {
//    setState(() {
//      isLoading = true;
//    });
    var uri = 'http://45.34.15.25:8080/Bitcoin/resources/getBitcoinList?size=${_size}';

    //  print(uri);
    var response = await get(Uri.parse(uri));
    //   print(response.body);
    final data = json.decode(response.body) as Map;
    //  print(data);
    if(data['error'] == false){
      setState(() {
        bitcoinList.addAll(data['data'].map<Bitcoin>((json) =>
            Bitcoin.fromJson(json)).toList());
        isLoading = false;
        _size = _size + data['data'].length;
      });

    }
    else {
      //  _ackAlert(context);
      setState(() {

      });

    }

  }
  Future<void> callCurrencyDetails(name) async {

    _saveProfileData(name);


  }

  _saveProfileData(String name) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setString("currencyName", name);
      sharedPreferences.setInt("index", 2);
      sharedPreferences.setString("title", 'TRENDS');
      sharedPreferences.commit();
    });

    Navigator.pushReplacementNamed(context, '/homePage');
  }


}

class LinearSales {
  final int count;
  final double rate;

  LinearSales(this.count, this.rate);
}