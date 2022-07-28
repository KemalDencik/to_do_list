import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Item.dart';

//görevler datası
class ItemData with ChangeNotifier {
  final List<Item> _items = [];

  static SharedPreferences _sharedPref;

  final List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toogleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(
      Item(title: title),
    );
    saveItemsToSharedPref(_items);
    notifyListeners();
    //kendisine bağlı herkese değişiklik olduğunu bildirir
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //shared pref metodları

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    //ıtemlardan oluşan bir listeyi Stringlerden oluşan listeye çevir
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
//sharedpref e kaydet
    _sharedPref.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {

    List<String> tempList = _sharedPref.getStringList('toDoData')??[];
    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(json.decode(item)));
    }
  }
}
