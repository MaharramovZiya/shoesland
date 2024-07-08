import 'package:flutter/material.dart';
import 'package:shoesland/data/models/product_model.dart';

class DetailPage extends StatelessWidget {
const DetailPage({ super.key, required this.product });
final Product product;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Image.asset(product.imagePath),
      ),
    );
  }
}