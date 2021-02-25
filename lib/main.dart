import 'package:flutter/material.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/pdt_detail_screen.dart';
import './screens/homepage.dart';
import 'package:provider/provider.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
//        ChangeNotifierProvider.value(
//          value: Orders(),
//        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kids E-commerce',
        color: Colors.red,
        home: HomePage(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
