import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/pdt_detail_screen.dart';
import '../models/cart.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final String imageUrl;
  final int quantity;
  final String name;

  CartPdt(this.id, this.productId, this.price, this.imageUrl,this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: ListTile(
          onTap: () {
           // Navigator.of(context).pushNamed(DetailPage.routeName, arguments:);
          },
          leading: CircleAvatar(
            child: FittedBox(child: Image.network(imageUrl)),
          ),
          title: Text(name),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
