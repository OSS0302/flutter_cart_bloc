import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_cart_bloc/catalog.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _cartBloc = CartBloc([]);
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(key : _cartBloc,
      child: BlocProvider(key: _cartBloc,
          builder: (BuildContext context, List state){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue
          ),
          home: LoginScreen(),
        );

    }),
    );
  }
}
 // 첫번째 화면 stful 위젯
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Enter'),
          onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context)=> Catalog()));
          }),
      ),
    );
  }
}




