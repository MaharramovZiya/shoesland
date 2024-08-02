import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/logic/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:shoesland/presentation/screens/details/detail_page.dart';

class FavoritesCart extends StatelessWidget {
  const FavoritesCart({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: productList[i]),
                ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
                Expanded(child: Image.asset(productList[i].imagePath)),
                Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[i].tag,
                        style: const TextStyle(color: Colours.blueColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productList[i].name,
                        style: const TextStyle(
                            color: Colours.blackLikeToColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        LocalStrings().detailPageTitle,
                        style: const TextStyle(color: Colours.greyColor),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$${productList[i].price.toString()}",
                            style: const TextStyle(
                                color: Colours.greyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddToCartEvent(productList[i]));
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(20)),
                                      color: Colours.blueColor),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}