import 'package:flutter/material.dart';
import '../models/ıtems_data.dart';
import '../screens/home_page.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;
  final Function deleteItem;

  ItemCard({this.isDone, this.title,this.toggleStatus,this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),//oluşturulan her değere otomatik anahtar(key) atar
      child: Card( //görevleri oluşturduğumuz alan
        color: Colors.red,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(//iconlu metin oluşturur
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Checkbox(
            value: isDone,
            activeColor: Colors.red,
            onChanged:toggleStatus,
          ), //yazının sağı veya solunda icon yarattırır
        ),
      ),
    );
  }
}
