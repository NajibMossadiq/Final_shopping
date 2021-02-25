import 'package:flutter/material.dart';
import '../widgets/all_pdts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
//        SizedBox(
//          height: 10,
//        ),
//        Center(
//            child: Text(
//          'Categories',
//          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//        )
//        ),
        SizedBox(
          height: 10,
        ),
        //Category(),
        Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Text(
            'Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        AllProducts()
      ],
    );
  }
}
