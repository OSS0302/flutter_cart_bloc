import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType { add, remove }

abstract class CartEvent {
  final CartEventType type;
  final Item item;

  // 생성자 생성
  CartEvent(this.type, this.item);
}

/// Notifies bloc to decrement state.
class CartPressed extends CartEvent {
  CartPressed(super.type, super.item);
}

abstract class CartState {
  List<Item>? cartList;
}

class CartValueState extends CartState {
  final List<Item> cartList;

  CartValueState(this.cartList);

  @override
  List<Object?> get props => [cartList];
}

class CartBloc{
  final itemList = [
    Item("맥북에어" , 2000000),
    Item("맥북프로" , 3500000),
    Item("아이폰14프로" ,1550000),
    Item("아이폰14프로맥스",1900000),
    Item("아이맥" , 3000000),
  ];
  final  List<Item> _cartList = [];

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]); // 초기 값 빈 배열 넣어준다.

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event){
    switch (event.type){
      case CartEventType.remove:
        print('????? remove ${event.item.title}');
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}


// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartValueState([])) {
//     on<CartPressed>((mapEventToState));
//   }
//
//   void mapEventToState(CartEvent event, Emitter<CartState> emit) async {
//     if (event is CartPressed) {
//       if (event.type == CartEventType.add) {
//         var item = state.cartList!;
//         item.add(event.item);
//         emit(CartValueState(item));
//       } else if (event.type == CartEventType.remove) {
//         var item = state.cartList!;
//         item.remove(event.item);
//         emit(CartValueState(item));
//       }
//     }
//   }
// }
