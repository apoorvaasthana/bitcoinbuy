import 'package:bitcoinbuy/coins_page.dart';
import 'package:bitcoinbuy/dashboard_page.dart';
import 'package:bitcoinbuy/localization/AppLanguage.dart';
import 'package:bitcoinbuy/localization/app_localizations.dart';
import 'package:bitcoinbuy/news_page.dart';
import 'package:bitcoinbuy/trends_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/LanguageData.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int _selectedIndex = 0;
  String _lable = 'HOME';
  SharedPreferences sharedPreferences;
  final PageStorageBucket bucket = PageStorageBucket();
  String languageCodeSaved;

  List<LanguageData> languages= [
    LanguageData(languageCode: "en",languageName: "English"),
    LanguageData(languageCode: "it",languageName: "Italian"),
    LanguageData(languageCode: "de",languageName: "German"),
    LanguageData(languageCode: "sv",languageName: "Swedish"),
    LanguageData(languageCode: "fr",languageName: "French"),
    LanguageData(languageCode: "nb",languageName: "Norwegian"),
    LanguageData(languageCode: "es",languageName: "Spanish"),
    LanguageData(languageCode: "nl",languageName: "Dutch"),
    LanguageData(languageCode: "fi",languageName: "Finnish"),
    LanguageData(languageCode: "ru",languageName: "Russian"),
    LanguageData(languageCode: "pt",languageName: "Portuguese"),
    LanguageData(languageCode: "ar",languageName: "Arabic"),

  ];

  @override
  void initState() {
    getSharedPrefData();


    super.initState();

  }
  Future<void> getSharedPrefData() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      _selectedIndex = prefs.getInt("index") ?? 0;
      _lable = prefs.getString("title") ?? 'HOME';
      languageCodeSaved  = prefs.getString('language_code')  ??  "en";
      _saveProfileData();
    });
  }
  _saveProfileData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("index", 0);
      sharedPreferences.setString("title", 'HOME');
      sharedPreferences.commit();
    });
  }
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
//        leading: IconButton(
////          icon: Icon(Icons.arrow_back, color: Colors.white),
//          //onPressed: () => Navigator.pushReplacementNamed(context, '/homePage'),
//        ),
        backgroundColor: Color(0xff4b67d8),
        centerTitle: true,
        title:
        _lable == "HOME"
            ?Text(AppLocalizations.of(context).translate('home_page_home'),textAlign: TextAlign.center,)
            :_lable== "COINS"
            ?Text(AppLocalizations.of(context).translate('home_page_coin'),textAlign: TextAlign.center,)
            :_lable=="TRENDS"?
        Text(AppLocalizations.of(context).translate('home_page_trends'),textAlign: TextAlign.center,):
        Text(AppLocalizations.of(context).translate('home_page_news'),textAlign: TextAlign.center,),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.language,
            ),
            onPressed: () {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(child: Text("Select Language")),
                      content: Container(
                          width: double.maxFinite,
                          child: ListView.builder(

                              shrinkWrap: true,
                              itemCount: languages.length,
                              itemBuilder: (BuildContext context, int i) {
                                return Container(
                                  child: Column(children: <Widget>[
                                    InkWell(
                                        onTap: () async {
                                          appLanguage.changeLanguage(
                                              Locale(languages[i].languageCode));
                                          await getSharedPrefData();
                                          Navigator.pop(context);
                                        },
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(languages[i].languageName),
                                            languageCodeSaved == languages[i].languageCode
                                                ? Icon(Icons.radio_button_checked,color: Colors.blue,)
                                                :Icon(Icons.radio_button_unchecked,color: Colors.blue,),
                                          ],)),



                                    Divider()

                                  ],),);
                              }

                          )
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        )
                      ],

                    );
                  }
              );
            },
          ),
        ],
      ),
      body:  PageStorage(
        child: _widgetOptions.elementAt(_selectedIndex),
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            title: Text(AppLocalizations.of(context).translate('home_page_home'), style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on, size: 30,),
            title: Text(AppLocalizations.of(context).translate('home_page_coin'), style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up, size: 30,),
            title: Text(AppLocalizations.of(context).translate('home_page_trends'), style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 30,),
            title: Text(AppLocalizations.of(context).translate('home_page_news'), style: TextStyle(fontSize: 12)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff4b67d8),
        selectedFontSize: 13,
        onTap: _onItemTapped,
      ),

    );
  }

  final List _widgetOptions = [
    DashboardPage(
      key: PageStorageKey('dashboardPageId'),
    ),
    CoinsPage(
      key: PageStorageKey('coinsPageId'),
    ),
    TrendPage(
      key: PageStorageKey('trendPageId'),
    ),
    NewsPage(
      key: PageStorageKey('newsPageId'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index ==0)
        _lable="HOME";
      else if(index == 1)
        _lable="COINS";
      else if(index == 2)
        _lable="TRENDS";
      else
        _lable="NEWS";

    });
  }
}
