 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar:  AppBar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
         create: (BuildContext context) =>_cartBloc,
        child: BlocBuilder<CartBloc, CartState>(
          bloc: _cartBloc,
          builder: (context,  state){
            var sum =0; // 초기값이 0이다.
          if(state.cartList!.length>0){
           sum = state.cartList!.map((item) => item.price)
                .reduce((acc, e) => acc+e);
          }
            return Center(
              child: Text('합계 :$sum',
             style:TextStyle(fontSize: 30) ,
              ),
            );
          }
        ),
      ),
    );
  }

}
