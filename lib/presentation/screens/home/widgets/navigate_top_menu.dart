
import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';

class NavigateTopMenu extends StatelessWidget {
  const NavigateTopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colours.white,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.window_outlined)),
          ),
        ),

        //Store location

        Column(
          children: [
            Text(LocalStrings().storeLocation),
            Text(LocalStrings().location)
          ],
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colours.white,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined)),
          ),
        ),
      ],
    );
  }
}
