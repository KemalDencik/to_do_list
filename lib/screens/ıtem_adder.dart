import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ıtems_data.dart';

class ItemAdder extends StatelessWidget {
  final textController =
      TextEditingController(); //KULLANICI TEXT E STRİNG GİRİNCE TEXT ALANININ EDİTİNG ALANINA ATANACAK
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),//ekranın görünmeyen kısmı kadar demek
      //mediaqeery alabileceği yer kadar alan al demek
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(//yeni görev yazacağımız text alanı
              minLines: 1,
              maxLines: 3,
              controller: textController,
              onChanged: (input) {
                print(textController.text);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Yeni Görev',
                  labelStyle: new TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  hintText: '...'),
              autofocus: true, //imlece basar basmaz yerinde olsun
            ),
            FlatButton(
              onPressed: () {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(textController.text);
                Navigator.pop(context);//ana sayfaya dönme
              },
              color: Theme.of(context).accentColor,
              child: Text(
                'Yeni Görev Ekle',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
