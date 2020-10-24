import 'package:bitcoinbuy/home_page.dart';
import 'package:bitcoinbuy/localization/AppLanguage.dart';
import 'package:bitcoinbuy/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'trends_page.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
        builder: (_) => appLanguage,
        child: Consumer<AppLanguage>(builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bitcoin',
            theme: ThemeData(
              primarySwatch: Colors.blue,

            ),
            locale: model.appLocal,

            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const  Locale('en', 'US'),
              const Locale('ar', ''),
              const  Locale('de', ''),
              const  Locale('es', ''),
              const Locale('fi', ''),
              const   Locale('fr', ''),
              const   Locale('it', ''),
              const   Locale('nl', ''),
              const   Locale('nb', ''),
              const   Locale('pt', ''),
              const   Locale('ru', ''),
              const  Locale('sv', '')
            ],

            routes: <String, WidgetBuilder>{
              '/myHomePage': (BuildContext context) => new MyHomePage(),
              '/homePage': (BuildContext context) => new HomePage(),
              '/trendPage': (BuildContext context) => new TrendPage(),

            },
            home: MyHomePage(),


          );


        }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    homePage();
    super.initState();
  }


  Future<void> homePage() async {
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
      Navigator.of(context).pushReplacementNamed('/homePage');
    });
  }
}
