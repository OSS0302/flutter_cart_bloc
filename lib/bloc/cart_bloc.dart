
import 'package:bloc/bloc.dart';

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
class CartBloc extends Bloc<CartEvent, List<Item>>{
  CartBloc(super.initialState);

  @override
  List<Item>? get initialState => []; //initialState 초기값

  get currentState => null;

  @override
  Stream<List<Item>> mapEventToState(CartEvent , event) async*{
    switch(event.type){
      case CartEventType.add:
        currentState.add(event.item);
        break;
      case CartEventType.remove:
        currentState.remove(event.item);
        break;
    }
    yield* currentState;

  }
}