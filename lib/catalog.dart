import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';



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
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => _cartBloc,
        child: BlocBuilder<CartBloc, List>(
            bloc: _cartBloc,
            builder: (context, state) {
              return ListView(
                children: _itemList
                    .map((item) => _buildItem(item, state, _cartBloc))
                    .toList(), //리스트로 재변환
              );
            }),
      ),
    );
  }

  Widget _buildItem(Item item, List state, CartBloc cartBloc) {
    final isChecked = state.contains(item); // 아이템 있는지 확인한다.
    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
            icon: isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.red,
                  )
                : Icon(Icons.check),
            onPressed: () {
              if (isChecked) {
                cartBloc.add(CartEvent(CartEventType.remove, item));
              } else {
                cartBloc.add(CartEvent(CartEventType.add, item));
              }
            }), // trailing은 오른쪽 끝에 쓸수있는기능
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }
}
