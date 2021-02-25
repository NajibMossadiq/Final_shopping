import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/widgets/badge.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name),
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
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          Text(
            'Price: \$${loadedPdt.price}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPdt.name, loadedPdt.price,loadedPdt.imgUrl);
        },
        child: Icon (Icons.shopping_cart,
        size: 30),
      ),
    );
  }
}
