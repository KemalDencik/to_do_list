import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



//olması gereken temaları oluşturduğum alan 
class ColorThemeData with ChangeNotifier {
  final ThemeData _RedTheme = ThemeData(
      primaryColor: Colors.red,
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black)));

  final ThemeData _GreenTheme = ThemeData(
      primaryColor: Colors.green,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      accentColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black)));

  ThemeData _selectedThemeData = ThemeData(
      primaryColor: Colors.red,
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(color: Colors.red),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black)));
  

  //item değerleri stringe çevirdim
  static SharedPreferences _sharedPref;
  bool _isGreen = true;
  void switchTheme(bool selected) {
    
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();//ilgili tüm alanlara haber veriyor
  }

  ThemeData get selectedThemeData => _isGreen? _RedTheme : _GreenTheme;
  bool get isGreen => _isGreen; 

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {// veri ekleme
    _sharedPref.setBool('ThemeData', value);
  }

  void loadThemeSharedPref() {//veri kaydı
    _isGreen = _sharedPref.getBool('ThemeData') == true;
  }
}
