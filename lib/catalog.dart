import 'package:flutter/material.dart';
import 'item.dart';

// 두번째 화면 stful 위젯
class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('catclog'),
        actions: <Widget>[
      IconButton(
          icon: Icon(Icons.archive),
          onPressed:() {

          },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }