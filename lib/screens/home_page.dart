import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/setting_page.dart';
import '../models/ıtems_data.dart';
import '../widget/ıtem_card.dart';
import 'ıtem_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
//ön yüz alanım
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: Icon(Icons.settings,size: 25,color: Colors.white), onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>SettingPage()));//tema seçme sayfasına ilerletme
          }, ),
        )],
        title: Text(
          'GÜNLÜK GÖREVİM',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              flex: 1,
              child: Container(
                //height: 100,
                child: Text(
                  '${Provider.of<ItemData>(context).items.length} Görev',
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Consumer<ItemData>(builder: (context,itemData,child)=>ListView.builder(
                    
                    //reverse listeye eleman ekledikçe eskileri aşşağı indirip yeniyi yukarı çıkartmaya yarar
                    itemCount: itemData.items.length,
                    itemBuilder: (context, index) => ItemCard(
                      title: itemData.items[index].title,
                      isDone:
                          itemData.items[index].isDone,
                      toggleStatus: (_) {
                        itemData
                            .toggleStatus(index);
                      },
                      deleteItem: (_) {
                       itemData
                            .deleteItem(index);
                      },
                    ),
                  ),)
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(//+ butonu yani ekleme butonum
        onPressed: () {
          showModalBottomSheet(
            //barrierColor: Colors.black,//Arka planın rengi
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              context: context, builder: (context) => SingleChildScrollView(child: ItemAdder()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
