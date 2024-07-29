import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildUI(context),
    );
  }
}

Widget buildUI(context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchNavigateTopMenu(context),
          const SizedBox(
            height: 25,
          ),
          _buildSearchBar(),
          const SizedBox(
            height: 35,
          ),
          _buildShoesHistory()
        ],
      ),
    ),
  ));
}

Widget _buildSearchBar() {
  return SearchBar(
    elevation: WidgetStateProperty.all(1),
    hintText: LocalStrings().lookforShoes,
    backgroundColor: WidgetStateProperty.all(Colors.white),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
    leading: const Icon(Icons.search),
  );
}

Widget _buildShoesHistory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        LocalStrings().shoes,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
      ),
      SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  leading: const Icon(Icons.watch_later_outlined),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                );
              }))
    ],
  );
}
