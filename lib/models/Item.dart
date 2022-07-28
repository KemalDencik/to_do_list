import 'package:flutter/material.dart';
import '../models/Item.dart';
 
   //ıtemleri stringe çevirme
class Item {
  final String title;
  bool isDone;
   Item({this.isDone=false, this.title});
  
 Item.fromMap(Map<String, dynamic> map)
      : title = map['title'],isDone = map['isDone'];

 

  void toogleStatus() {
    isDone = !isDone;
  }
  
  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
