import 'package:flutter/widgets.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({Key? key, CartBloc? cartBloc, required Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key,  child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

// 사용하고있는 패턴을 흉내낸다.
  static CartBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CartProvider>()!.cartBloc);
}
