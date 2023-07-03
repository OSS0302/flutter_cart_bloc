 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_provider.dart';
import 'package:flutter_cart_bloc/main.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
   final cartBloc =CartProvider.of(context);
    final cartList = CartBloc();
    return Scaffold(
      appBar:  AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder(
        stream: cartBloc.cartList,
          builder:(context,snapshot){
            var sum = 0; // 초기값이 0이다.
            if(snapshot.data != null && snapshot.data!.isNotEmpty){
              sum = snapshot.data!.map((item) => item.price)
                  .reduce((acc, e) => acc+e);
            }
            return Center(
              child: Text('합계 :$sum',
                style:TextStyle(fontSize: 30) ,
              ),
            );
          }
      ),
    );
  }

}
