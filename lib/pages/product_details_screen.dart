import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Map product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product['title']),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: MaterialButton(
            color:Colors.blueAccent,
            onPressed: (){
              
            },
            child: Text("${"N"+widget.product['price']} Buy Now",style: TextStyle(color: Colors.white),),
            ),
        ),
      ),
    );
  }
}
