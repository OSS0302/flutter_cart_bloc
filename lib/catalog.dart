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
        children: _itemList
            .map((item) => _buildItem(item))
        .toList(), //리스트로 재변환
      ),
    );
  }

  Widget _buildItem(Item item){
    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle:Text(
          '${item.price}'
        ) ,
        trailing: IconButton(icon: Icon(Icons.check), onPressed: () {}) , // trailing은 오른쪽 끝에 쓸수있는기능
      ),padding: const EdgeInsets.all(8.0),
    );
  }
}