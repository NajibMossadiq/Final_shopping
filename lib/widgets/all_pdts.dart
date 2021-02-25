import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import './pdt_item.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
//  @override
//  void initState() {
//    super.initState();
//    _makeRequest();
//  }
//  List data;
//  Future<String> _makeRequest() async {
//    var url = "url";
//    var response = await http.get(Uri.encodeFull(url));
//    setState(() {
//      var extractData = json.decode(response.body);
//      data = extractData["Rooms"];
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final pdts=productData.items;
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: pdts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i)=>ChangeNotifierProvider.value(value: pdts[i],
        child: PdtItem(name: pdts[i].name,imageUrl: pdts[i].imgUrl,)),
    );
  }
}