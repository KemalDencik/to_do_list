import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/colorThemeData.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tema Seçimi'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SwitchCard());
  }
}

class SwitchCard extends StatelessWidget {
 ////State<SwitchCard> createState() => _SwitchCardState();
//}

//class _SwitchCardState extends State<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    //yeşil tema oluşturma kırmızı tmea oluşturma
    Text greentext = Text(
      'Yeşil',
      style: TextStyle(color: Colors.green),
    );
    Text redtext = Text(
      'Kırmızı',
      style: TextStyle(color: Colors.red),
    );
    bool _value = Provider.of<ColorThemeData>(context).isGreen;//basitçe kendi state'i olan ve bu state'i BuildContext ile kendi çocuklarına aktarabilen bir widget.
    return Card(
      child: SwitchListTile(
        subtitle: _value ? greentext : redtext,//kırmızı veya yeşil olduğunu kontrol ediyor
        title: Text(
          'Tema Rengini Değiştir',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        value: _value,
        onChanged: (bool value) {
  //        setState(() {
    //        _value = value;
      //    });
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
