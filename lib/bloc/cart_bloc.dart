import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/Item.dart';

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

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartValueState([])) {
    on<CartPressed>((mapEventToState));
  }

  void mapEventToState(CartEvent event, Emitter<CartState> emit) async {
    if (event is CartPressed) {
      if (event.type == CartEventType.add) {
        var item = state.cartList!;
        item.add(event.item);
        emit(CartValueState(item));
      } else if (event.type == CartEventType.remove) {
        var item = state.cartList!;
        item.remove(event.item);
        emit(CartValueState(item));
      }
    }
  }
}
