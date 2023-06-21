import 'package:flutter_bloc/flutter_bloc.dart';

import '../Item.dart';

enum CartEventType{
  add, remove
}
class CartEvent{
  final CartEventType type;
  final Item item;

  // 생성자 생성
  CartEvent(this.type, this.item);
}
class CartBloc extends Bloc<CartEvent ,List<Item>>{
@override
  //TODO: implement initialState
  List<Item> get initialState => null;
@override
  Stream<List<Item>> mapEventToState(CartEvent event){
  //TODO: implements mapEventToState
  return null;
  }
}