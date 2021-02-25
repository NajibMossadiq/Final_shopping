import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/cart.dart';
import 'package:shopping/widgets/badge.dart';
import 'package:shopping/widgets/home_body.dart';
import '../screens/cart_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Kids Shoping App'),
        actions: <Widget>[
          cart.totalAmount == 0
              ?
          IconButton(icon: Icon(Icons.shopping_cart, size: 30,),
              onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
              :
          Consumer<Cart>(
            builder: (_, cartObject, child) => Badge(
              child: child,
              color: Colors.red,
              value: cartObject.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: HomeBody()
    );
  }
}