import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';

class RealtedShoesWidget extends StatelessWidget {
  const RealtedShoesWidget({
    super.key,
    required this.filteredProducts,
  });

  final List<Product> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            Product relatedProduct = filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(product: relatedProduct),
                    ));
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(relatedProduct.imagePath)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colours.backgroundColor),
              ),
            );
          }),
    );
  }
}
