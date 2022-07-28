import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:to_do/models/%C4%B1tems_data.dart';
import 'package:to_do/models/colorThemeData.dart';
import 'package:to_do/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//Widgets çerçevesine dayalı uygulamalar için somut bir bağlama.
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(MultiProvider(providers: [ //birden çok veriyi okuma işlmei yapar
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorThemeData>(context).loadThemeSharedPref();
    Provider.of<ItemData>(context).loadItemsFromSharedPref();
    return Consumer2<ItemData, ColorThemeData>(
        //consumer yardımıyla yayın dinleme
        builder: (context, itemData, colorThemeData, child) {
      itemData.loadItemsFromSharedPref();
      colorThemeData.loadThemeSharedPref();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ColorThemeData>(context).selectedThemeData,
        home: SplashWidget(),
      );
    });
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 10,
        navigateAfterSeconds:  HomePage(),
        title:  Text('Günlük Görevlerin',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
        image:  Image.asset('assets/kız.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader:  TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}


















/*ThemeData RedTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black)));

ThemeData GreenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black)));*/
