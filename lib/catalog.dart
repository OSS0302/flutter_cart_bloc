import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/cart.dart';
import 'package:flutter_cart_bloc/main.dart';

// 두번째 화면 stful 위젯
class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context); // cartProvider에서 만든 context 카트블럭을 를가져와서 cartBloc애 넣는다.
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_)=> Cart()));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
          builder: (context, snapshot){
          print('hihih' );
          return snapshot.data != null
              ? ListView(
            children: cartBloc.itemList
                .map((item) => _buildItem(item, snapshot.data!, cartBloc))
                .toList(), //리스트로 재변환
          ) : Container();
          }
      )
    );
  }

  Widget _buildItem(Item item, List<Item> state, CartBloc cartBloc ) {
    final isChecked = state.contains(item); // 아이템 있는지 확인한다.
    // final isChecked = state.contains(item); // 아이템 있는지 확인한다.
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
              color: Colors.blue,
            )
                : Icon(Icons.check),
            onPressed: () {
              if (isChecked) {
                cartBloc.add(CartPressed(CartEventType.remove, item));
              } else {
                cartBloc.add(CartPressed(CartEventType.add, item));
              }
            }), // trailing은 오른쪽 끝에 쓸수있는기능
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }
}
